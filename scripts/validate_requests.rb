#!/usr/bin/env ruby
# 验证 Request 类与 OpenAPI 规范的一致性

require 'json'
require 'set'

# 读取 OpenAPI 规范
openapi_file = File.join(__dir__, '../docs/openapi.oas4.2.json')
openapi_data = JSON.parse(File.read(openapi_file))

schemas = openapi_data['components']['schemas']

# 提取所有 CreateRequest 和 UpdateRequest 的属性
def extract_properties(schema_data)
  return nil unless schema_data

  data_properties = schema_data.dig('properties', 'data', 'properties')
  return nil unless data_properties

  attributes = data_properties.dig('attributes', 'properties')
  relationships = data_properties.dig('relationships', 'properties')
  required_attrs = data_properties.dig('attributes', 'required') || []
  required_rels = data_properties.dig('relationships', 'required') || []

  {
    attributes: attributes&.keys || [],
    relationships: relationships&.keys || [],
    required_attributes: required_attrs,
    required_relationships: required_rels
  }
end

# 读取 Ruby Request 类的属性
def extract_ruby_properties(file_path)
  return nil unless File.exist?(file_path)

  content = File.read(file_path)

  attributes = []
  relationships = []
  required_attrs = []
  required_rels = []

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
      match = line.match(/property :(\w+)(, required: true)?/)
      if match
        prop_name = match[1]
        is_required = !match[2].nil?

        if in_attributes
          attributes << prop_name
          required_attrs << prop_name if is_required
        elsif in_relationships
          relationships << prop_name
          required_rels << prop_name if is_required
        end
      end
    end
  end

  {
    attributes: attributes,
    relationships: relationships,
    required_attributes: required_attrs,
    required_relationships: required_rels
  }
end

# 转换 schema 名称到文件路径
def schema_to_file_path(schema_name)
  # 例如: WebhookCreateRequest -> webhook/create.rb
  # 例如: AccessibilityDeclarationCreateRequest -> accessibility_declaration/create.rb

  name = schema_name.gsub(/CreateRequest$/, '').gsub(/UpdateRequest$/, '')

  # 转换驼峰命名到下划线命名
  snake_case = name.gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
                   .gsub(/([a-z\d])([A-Z])/, '\1_\2')
                   .downcase

  action = schema_name.end_with?('CreateRequest') ? 'create' : 'update'
  version = schema_name.include?('V2') ? 'v2' : 'v1'

  # 移除可能的版本后缀
  snake_case = snake_case.gsub(/_v2$/, '')

  "/Users/wade/MyDocument/ScriptCode/app_store_dev_api/lib/app_store_dev_api/requests/#{version}/#{snake_case}/#{action}.rb"
end

# 主验证逻辑
mismatches = []
total_checked = 0

schemas.each do |schema_name, schema_data|
  next unless schema_name.end_with?('CreateRequest', 'UpdateRequest')

  openapi_props = extract_properties(schema_data)
  next unless openapi_props

  file_path = schema_to_file_path(schema_name)
  next unless File.exist?(file_path)

  ruby_props = extract_ruby_properties(file_path)
  next unless ruby_props

  total_checked += 1

  # 对比属性
  openapi_attrs = Set.new(openapi_props[:attributes])
  ruby_attrs = Set.new(ruby_props[:attributes])

  missing_attrs = openapi_attrs - ruby_attrs
  extra_attrs = ruby_attrs - openapi_attrs

  # 对比关系
  openapi_rels = Set.new(openapi_props[:relationships])
  ruby_rels = Set.new(ruby_props[:relationships])

  missing_rels = openapi_rels - ruby_rels
  extra_rels = ruby_rels - openapi_rels

  if missing_attrs.any? || extra_attrs.any? || missing_rels.any? || extra_rels.any?
    mismatches << {
      schema: schema_name,
      file: file_path.gsub('/Users/wade/MyDocument/ScriptCode/app_store_dev_api/', ''),
      missing_attributes: missing_attrs.to_a.sort,
      extra_attributes: extra_attrs.to_a.sort,
      missing_relationships: missing_rels.to_a.sort,
      extra_relationships: extra_rels.to_a.sort
    }
  end
end

# 输出报告
puts "=" * 80
puts "API 接口一致性验证报告"
puts "=" * 80
puts "总检查数: #{total_checked}"
puts "不一致数: #{mismatches.length}"
puts "一致性: #{((total_checked - mismatches.length) * 100.0 / total_checked).round(2)}%"
puts "=" * 80
puts

if mismatches.any?
  puts "发现以下不一致："
  puts

  mismatches.each_with_index do |mismatch, index|
    puts "#{index + 1}. #{mismatch[:schema]}"
    puts "   文件: #{mismatch[:file]}"

    if mismatch[:missing_attributes].any?
      puts "   ❌ 缺失属性: #{mismatch[:missing_attributes].join(', ')}"
    end

    if mismatch[:extra_attributes].any?
      puts "   ⚠️  多余属性: #{mismatch[:extra_attributes].join(', ')}"
    end

    if mismatch[:missing_relationships].any?
      puts "   ❌ 缺失关系: #{mismatch[:missing_relationships].join(', ')}"
    end

    if mismatch[:extra_relationships].any?
      puts "   ⚠️  多余关系: #{mismatch[:extra_relationships].join(', ')}"
    end

    puts
  end

  # 保存详细报告到 JSON 文件
  report_file = File.join(__dir__, 'validation_report.json')
  File.write(report_file, JSON.pretty_generate(mismatches))
  puts "详细报告已保存到: #{report_file}"
else
  puts "✅ 所有接口都与 OpenAPI 规范一致！"
end
