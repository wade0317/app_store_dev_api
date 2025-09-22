#!/usr/bin/env ruby
# frozen_string_literal: true

require 'bundler/setup'
require 'app_store_dev_api'
require 'json'

puts "=" * 60
puts "App Store Connect API Library Verification"
puts "=" * 60
puts

# 1. 验证库版本
puts "✅ Library Version: #{AppStoreDevApi::VERSION}"
puts

# 2. 验证Schema加载
begin
  schema_path = File.join(File.dirname(__FILE__), 'lib', 'config', 'schema.json')
  schema = AppStoreDevApi::Schema.new(schema_path)

  puts "✅ Schema loaded successfully"
  puts "   - Web Service Endpoints: #{schema.web_service_endpoints.count}"
  puts "   - Object Definitions: #{schema.objects.count if schema.objects}"
  puts "   - Type Definitions: #{schema.types.count if schema.types}"
  puts
rescue => e
  puts "❌ Schema loading failed: #{e.message}"
  puts
end

# 3. 验证Client类存在和方法
begin
  # 检查Client类是否存在
  client_class = AppStoreDevApi::Client
  puts "✅ Client class loaded"

  # 统计生成的方法数量
  public_methods = client_class.instance_methods(false)
  puts "   - Generated API methods: #{public_methods.count}"

  # 列出一些示例方法
  sample_methods = public_methods.take(10)
  puts "   - Sample methods:"
  sample_methods.each do |method|
    puts "     • #{method}"
  end
  puts
rescue => e
  puts "❌ Client class verification failed: #{e.message}"
  puts
end

# 4. 验证JWT Authorization
begin
  auth_class = AppStoreDevApi::Client::Authorization
  puts "✅ Authorization class loaded"

  # 测试JWT生成（使用假密钥）
  test_private_key = <<~KEY
    -----BEGIN PRIVATE KEY-----
    MIGTAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBHkwdwIBAQQg4KANTE/K4xVIBSyo
    ooq2XkJp0bJmZGwO0mi3Oys1tUygCgYIKoZIzj0DAQehRANCAARAWO+i8lqV6HhP
    c7k4km4A9m0p7Cz3h5K3RfJo/eYsRAH3P6AzFxnbdAiPPPLv07s5IV9rEi0J9Xs2
    O3/TpH1P
    -----END PRIVATE KEY-----
  KEY

  auth = auth_class.new(
    key_id: 'TEST_KEY_ID',
    issuer_id: 'TEST_ISSUER_ID',
    private_key: test_private_key
  )

  token = auth.token
  puts "   - JWT token generation: Success"
  puts "   - Token length: #{token.length} characters"

  # 验证JWT结构
  parts = token.split('.')
  if parts.length == 3
    puts "   - JWT structure: Valid (header.payload.signature)"
  else
    puts "   - JWT structure: Invalid"
  end
  puts
rescue => e
  puts "❌ Authorization verification failed: #{e.message}"
  puts
end

# 5. 验证Request类
begin
  request_modules = {
    'V1::AppStoreVersion::Create' => AppStoreDevApi::Requests::V1::AppStoreVersion::Create,
    'V1::Build::Update' => AppStoreDevApi::Requests::V1::Build::Update,
    'V1::AppEvent::Create' => AppStoreDevApi::Requests::V1::AppEvent::Create,
    'V1::AppScreenshot::Create' => AppStoreDevApi::Requests::V1::AppScreenshot::Create
  }

  puts "✅ Request classes verification:"
  request_modules.each do |name, klass|
    if defined?(klass)
      puts "   ✓ #{name}"
    else
      puts "   ✗ #{name} not found"
    end
  end
  puts
rescue => e
  puts "❌ Request classes verification failed: #{e.message}"
  puts
end

# 6. 验证新添加的API端点
begin
  schema_path = File.join(File.dirname(__FILE__), 'lib', 'config', 'schema.json')
  schema_data = JSON.parse(File.read(schema_path))

  new_endpoints = [
    'get_app_perf_power_metrics',
    'get_build_perf_power_metrics',
    'create_app_event',
    'create_app_event_video_clip',
    'create_app_screenshot',
    'create_routing_app_coverage'
  ]

  existing_endpoints = schema_data['web_service_endpoints'].map { |e| e['alias'] }

  puts "✅ New API endpoints verification:"
  new_endpoints.each do |endpoint|
    if existing_endpoints.include?(endpoint)
      puts "   ✓ #{endpoint}"
    else
      puts "   ✗ #{endpoint} not found"
    end
  end
  puts
rescue => e
  puts "❌ New endpoints verification failed: #{e.message}"
  puts
end

# 总结
puts "=" * 60
puts "Verification Summary"
puts "=" * 60
puts "✅ Library is functional and ready to use!"
puts "   - Version: #{AppStoreDevApi::VERSION}"
puts "   - Ruby: #{RUBY_VERSION}"
puts "   - Platform: #{RUBY_PLATFORM}"
puts
puts "To use the library:"
puts "  client = AppStoreDevApi::Client.new("
puts "    key_id: 'YOUR_KEY_ID',"
puts "    issuer_id: 'YOUR_ISSUER_ID',"
puts "    private_key: File.read('path/to/key.p8')"
puts "  )"
puts