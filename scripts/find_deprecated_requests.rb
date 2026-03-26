#!/usr/bin/env ruby
# 查找代码库中存在但 OpenAPI v4.2 中不存在的废弃接口

require 'json'
require 'set'

# 读取 OpenAPI 规范
openapi_file = File.join(__dir__, '../docs/openapi.oas4.2.json')
openapi_data = JSON.parse(File.read(openapi_file))

schemas = openapi_data['components']['schemas']

# 提取所有 OpenAPI 中定义的 CreateRequest 和 UpdateRequest
openapi_requests = Set.new
schemas.each_key do |schema_name|
  if schema_name.end_with?('CreateRequest', 'UpdateRequest')
    openapi_requests.add(schema_name)
  end
end

puts "OpenAPI v4.2 中定义的 Request 总数: #{openapi_requests.size}"
puts

# 扫描代码库中的所有 Request 类
def find_all_request_files
  request_files = []

  ['v1', 'v2'].each do |version|
    base_dir = "/Users/wade/MyDocument/ScriptCode/app_store_dev_api/lib/app_store_dev_api/requests/#{version}"
    next unless Dir.exist?(base_dir)

    Dir.glob("#{base_dir}/**/create.rb").each do |file|
      request_files << { file: file, version: version, action: 'create' }
    end

    Dir.glob("#{base_dir}/**/update.rb").each do |file|
      request_files << { file: file, version: version, action: 'update' }
    end
  end

  request_files
end

# 从文件路径推断 schema 名称
def file_path_to_schema_name(file_path, version, action)
  # 例如: lib/app_store_dev_api/requests/v1/webhook/create.rb
  # 返回: WebhookCreateRequest

  parts = file_path.split('/')

  # 获取模块名（倒数第二个部分）
  module_name = parts[-2]

  # 转换为驼峰命名
  camel_case = module_name.split('_').map(&:capitalize).join

  # 添加版本后缀（如果是 v2）
  if version == 'v2'
    # 检查是否已经有 V2 后缀
    unless camel_case.end_with?('V2')
      camel_case += 'V2'
    end
  end

  # 添加 action 后缀
  action_suffix = action.capitalize + 'Request'

  "#{camel_case}#{action_suffix}"
end

# 收集代码库中的所有 Request 类
code_requests = {}
request_files = find_all_request_files

request_files.each do |info|
  schema_name = file_path_to_schema_name(info[:file], info[:version], info[:action])
  code_requests[schema_name] = info[:file]
end

puts "代码库中的 Request 类总数: #{code_requests.size}"
puts

# 找出废弃的 Request 类
deprecated_requests = []

code_requests.each do |schema_name, file_path|
  unless openapi_requests.include?(schema_name)
    # 尝试不同的命名变体
    variants = [
      schema_name,
      schema_name.gsub('V2', ''), # 移除 V2
      schema_name.gsub(/([a-z])([A-Z])/, '\1_\2').downcase.split('_').map(&:capitalize).join # 重新格式化
    ]

    found = variants.any? { |v| openapi_requests.include?(v) }

    unless found
      deprecated_requests << {
        schema: schema_name,
        file: file_path.gsub('/Users/wade/MyDocument/ScriptCode/app_store_dev_api/', '')
      }
    end
  end
end

# 输出结果
puts "=" * 80
puts "废弃接口检测报告"
puts "=" * 80
puts

if deprecated_requests.empty?
  puts "✅ 太棒了！没有发现废弃的 Request 类"
  puts "   代码库中的所有接口都存在于 OpenAPI v4.2 规范中"
else
  puts "⚠️  发现 #{deprecated_requests.size} 个可能已废弃的 Request 类："
  puts

  deprecated_requests.each_with_index do |req, index|
    puts "#{index + 1}. #{req[:schema]}"
    puts "   文件: #{req[:file]}"
    puts
  end

  puts "=" * 80
  puts "建议："
  puts "1. 确认这些接口确实已被 Apple 废弃"
  puts "2. 如果确认废弃，可以删除这些文件"
  puts "3. 在 CHANGELOG 中记录删除的接口"
  puts

  # 保存详细报告
  report_file = File.join(__dir__, 'deprecated_requests.json')
  File.write(report_file, JSON.pretty_generate(deprecated_requests))
  puts "详细报告已保存到: #{report_file}"
end

puts
puts "=" * 80
puts "统计信息"
puts "=" * 80
puts "OpenAPI 中的 Request: #{openapi_requests.size}"
puts "代码库中的 Request: #{code_requests.size}"
puts "可能废弃的 Request: #{deprecated_requests.size}"
puts "有效的 Request: #{code_requests.size - deprecated_requests.size}"
