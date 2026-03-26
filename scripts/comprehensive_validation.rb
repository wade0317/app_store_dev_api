#!/usr/bin/env ruby
# 全面验证：schema.json、Request 类、OpenAPI v4.2 三方一致性

require 'json'
require 'set'

puts "=" * 100
puts "🔍 全面一致性验证：schema.json ↔ Request 类 ↔ OpenAPI v4.2"
puts "=" * 100
puts

# 1. 读取 OpenAPI 规范
openapi_file = File.join(__dir__, '../docs/openapi.oas4.2.json')
openapi_data = JSON.parse(File.read(openapi_file))
openapi_schemas = openapi_data['components']['schemas']
openapi_paths = openapi_data['paths']

# 2. 读取 schema.json 配置
schema_files = [
  File.join(__dir__, '../lib/config/schema_v4.3.json'),
  File.join(__dir__, '../lib/config/schema.json')
].find { |f| File.exist?(f) }

if schema_files.nil?
  puts "❌ 错误: 未找到 schema.json 文件"
  exit 1
end

schema_data = JSON.parse(File.read(schema_files))
schema_endpoints = schema_data['web_service_endpoints'] || []

# 3. 扫描所有 Request 类文件
def scan_request_classes
  request_classes = []

  ['v1', 'v2'].each do |version|
    base_dir = File.join(__dir__, "../lib/app_store_dev_api/requests/#{version}")
    next unless Dir.exist?(base_dir)

    Dir.glob("#{base_dir}/**/{create,update}.rb").each do |file|
      request_classes << {
        file: file.gsub(__dir__ + '/../', ''),
        version: version,
        action: File.basename(file, '.rb')
      }
    end
  end

  request_classes
end

request_classes = scan_request_classes

puts "📊 统计信息："
puts "  OpenAPI 路径数: #{openapi_paths.size}"
puts "  OpenAPI Request Schemas: #{openapi_schemas.select { |k, _| k.end_with?('Request') }.size}"
puts "  schema.json 端点数: #{schema_endpoints.size}"
puts "  Request 类文件数: #{request_classes.size}"
puts

# ==================== 验证 1: schema.json vs OpenAPI ====================
puts "=" * 100
puts "📋 验证 1/3: schema.json 配置 vs OpenAPI 路径"
puts "=" * 100
puts

schema_issues = []

schema_endpoints.each do |endpoint|
  alias_name = endpoint['alias']
  http_method = endpoint['http_method']
  url = endpoint['url']

  # 提取路径（去掉 base URL）
  path = url.gsub('https://api.appstoreconnect.apple.com', '')

  # 检查路径是否存在
  unless openapi_paths.key?(path)
    schema_issues << {
      type: 'path_not_found',
      alias: alias_name,
      path: path,
      method: http_method
    }
    next
  end

  # 检查 HTTP 方法是否存在
  path_methods = openapi_paths[path]
  unless path_methods.key?(http_method)
    schema_issues << {
      type: 'method_not_found',
      alias: alias_name,
      path: path,
      method: http_method,
      available_methods: path_methods.keys
    }
  end
end

if schema_issues.empty?
  puts "✅ 所有 schema.json 端点都在 OpenAPI 中存在"
else
  puts "⚠️  发现 #{schema_issues.size} 个问题："
  schema_issues.each_with_index do |issue, idx|
    puts "\n#{idx + 1}. #{issue[:alias]}"
    if issue[:type] == 'path_not_found'
      puts "   路径不存在: #{issue[:method].upcase} #{issue[:path]}"
    else
      puts "   方法不存在: #{issue[:method].upcase} #{issue[:path]}"
      puts "   可用方法: #{issue[:available_methods].map(&:upcase).join(', ')}"
    end
  end
end
puts

# ==================== 验证 2: Request 类 vs OpenAPI Schemas ====================
puts "=" * 100
puts "📋 验证 2/3: Request 类实现 vs OpenAPI Request Schemas"
puts "=" * 100
puts

# 从文件路径推断 schema 名称
def file_to_schema_name(file_path, version, action)
  parts = file_path.split('/')
  module_name = parts[-2]

  camel_case = module_name.split('_').map(&:capitalize).join

  if version == 'v2' && !camel_case.end_with?('V2')
    camel_case += 'V2'
  end

  action_suffix = action.capitalize + 'Request'
  "#{camel_case}#{action_suffix}"
end

# 提取 Request 类的属性定义
def extract_request_properties(file_path)
  return nil unless File.exist?(file_path)

  content = File.read(file_path)

  attributes = []
  relationships = []

  in_attributes = false
  in_relationships = false

  content.each_line do |line|
    line = line.strip

    if line == 'attributes do'
      in_attributes = true
      in_relationships = false
    elsif line == 'relationships do'
      in_relationships = true
      in_attributes = false
    elsif line == 'end'
      in_attributes = false if in_attributes
      in_relationships = false if in_relationships
    elsif line.start_with?('property :')
      match = line.match(/property :(\w+)/)
      if match
        prop_name = match[1]
        next if prop_name == 'id'  # 跳过 id

        if in_attributes
          attributes << prop_name
        elsif in_relationships
          relationships << prop_name
        end
      end
    end
  end

  { attributes: attributes, relationships: relationships }
end

# 提取 OpenAPI Schema 的属性定义
def extract_openapi_schema_properties(schema_data)
  return nil unless schema_data

  data_props = schema_data.dig('properties', 'data', 'properties')
  return nil unless data_props

  attributes = data_props.dig('attributes', 'properties')&.keys || []
  relationships = data_props.dig('relationships', 'properties')&.keys || []

  { attributes: attributes, relationships: relationships }
end

request_issues = []

request_classes.each do |req|
  schema_name = file_to_schema_name(req[:file], req[:version], req[:action])

  # 检查 schema 是否存在
  unless openapi_schemas.key?(schema_name)
    request_issues << {
      type: 'schema_not_found',
      file: req[:file],
      schema: schema_name
    }
    next
  end

  # 提取属性
  file_path = File.join(__dir__, '..', req[:file])
  request_props = extract_request_properties(file_path)
  openapi_props = extract_openapi_schema_properties(openapi_schemas[schema_name])

  next unless request_props && openapi_props

  # 对比属性
  req_attrs = Set.new(request_props[:attributes])
  api_attrs = Set.new(openapi_props[:attributes])

  missing_attrs = api_attrs - req_attrs
  extra_attrs = req_attrs - api_attrs

  # 对比关系
  req_rels = Set.new(request_props[:relationships])
  api_rels = Set.new(openapi_props[:relationships])

  missing_rels = api_rels - req_rels
  extra_rels = req_rels - api_rels

  if missing_attrs.any? || extra_attrs.any? || missing_rels.any? || extra_rels.any?
    request_issues << {
      type: 'property_mismatch',
      file: req[:file],
      schema: schema_name,
      missing_attributes: missing_attrs.to_a,
      extra_attributes: extra_attrs.to_a,
      missing_relationships: missing_rels.to_a,
      extra_relationships: extra_rels.to_a
    }
  end
end

if request_issues.empty?
  puts "✅ 所有 Request 类都与 OpenAPI Schemas 一致"
else
  puts "⚠️  发现 #{request_issues.size} 个问题："
  request_issues.each_with_index do |issue, idx|
    puts "\n#{idx + 1}. #{issue[:schema]}"
    puts "   文件: #{issue[:file]}"

    if issue[:type] == 'schema_not_found'
      puts "   ❌ OpenAPI 中不存在此 Schema"
    else
      if issue[:missing_attributes].any?
        puts "   ❌ 缺失属性: #{issue[:missing_attributes].join(', ')}"
      end
      if issue[:extra_attributes].any?
        puts "   ⚠️  多余属性: #{issue[:extra_attributes].join(', ')}"
      end
      if issue[:missing_relationships].any?
        puts "   ❌ 缺失关系: #{issue[:missing_relationships].join(', ')}"
      end
      if issue[:extra_relationships].any?
        puts "   ⚠️  多余关系: #{issue[:extra_relationships].join(', ')}"
      end
    end
  end
end
puts

# ==================== 验证 3: 三方完整性检查 ====================
puts "=" * 100
puts "📋 验证 3/3: 三方完整性检查"
puts "=" * 100
puts

# 检查 OpenAPI 中所有 POST/PATCH/PUT 端点是否都有对应的配置和实现
completeness_issues = []

openapi_paths.each do |path, methods|
  methods.each do |method, details|
    next unless ['post', 'patch', 'put'].include?(method)

    operation_id = details['operationId']
    next unless operation_id

    # 检查是否有对应的 schema.json 配置
    schema_endpoint = schema_endpoints.find do |ep|
      ep['url'].include?(path) && ep['http_method'] == method
    end

    unless schema_endpoint
      completeness_issues << {
        type: 'missing_in_schema',
        path: path,
        method: method,
        operation_id: operation_id
      }
    end
  end
end

if completeness_issues.empty?
  puts "✅ OpenAPI 中所有 POST/PATCH/PUT 端点都有对应配置"
else
  puts "⚠️  发现 #{completeness_issues.size} 个端点缺少 schema.json 配置："
  completeness_issues.take(10).each_with_index do |issue, idx|
    puts "  #{idx + 1}. #{issue[:method].upcase} #{issue[:path]}"
    puts "     operationId: #{issue[:operation_id]}"
  end

  if completeness_issues.size > 10
    puts "  ... 还有 #{completeness_issues.size - 10} 个"
  end
end
puts

# ==================== 总结 ====================
puts "=" * 100
puts "📊 验证总结"
puts "=" * 100
puts

total_issues = schema_issues.size + request_issues.size + completeness_issues.size

if total_issues == 0
  puts "🎉 完美！所有验证都通过："
  puts "  ✅ schema.json 配置完全匹配 OpenAPI"
  puts "  ✅ Request 类实现完全匹配 OpenAPI Schemas"
  puts "  ✅ 所有端点都有完整的实现"
  puts
  puts "当前状态: 100% 符合 OpenAPI v4.2 规范"
else
  puts "⚠️  发现 #{total_issues} 个问题需要修复："
  puts "  - schema.json 配置问题: #{schema_issues.size}"
  puts "  - Request 类实现问题: #{request_issues.size}"
  puts "  - 完整性问题: #{completeness_issues.size}"
  puts
  puts "建议: 根据上述问题进行修复"
end

# 保存详细报告
report = {
  timestamp: Time.now.iso8601,
  summary: {
    total_issues: total_issues,
    schema_issues: schema_issues.size,
    request_issues: request_issues.size,
    completeness_issues: completeness_issues.size
  },
  schema_issues: schema_issues,
  request_issues: request_issues,
  completeness_issues: completeness_issues
}

report_file = File.join(__dir__, 'comprehensive_validation_report.json')
File.write(report_file, JSON.pretty_generate(report))

puts
puts "详细报告已保存到: #{report_file}"
