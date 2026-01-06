# frozen_string_literal: true

require "bundler/gem_tasks"
require_relative "lib/app_store_dev_api/version"

desc "构建并安装 gem 到本地"
task :install_local do
  version = AppStoreDevApi::VERSION
  gem_name = "app_store_dev_api"
  gem_file = "#{gem_name}-#{version}.gem"

  puts "=" * 50
  puts "本地构建和安装"
  puts "=" * 50
  puts "项目: #{gem_name}"
  puts "版本: #{version}"
  puts

  # 清理旧的 gem 文件
  puts "清理旧的 gem 文件..."
  FileList["*.gem"].each { |f| rm f }

  # 构建 gem
  puts "构建 gem..."
  sh "gem build #{gem_name}.gemspec"

  # 安装到本地
  if File.exist?(gem_file)
    puts "安装到本地..."
    sh "gem install #{gem_file}"
    puts
    puts "✅ 安装成功！"
    puts
    puts "使用方法:"
    puts "  require 'app_store_dev_api'"
    puts "  client = AppStoreDevApi::Client.new(...)"
  else
    puts "❌ 错误: 未找到构建的 gem 文件: #{gem_file}"
    exit 1
  end
end

desc "清理构建的 gem 文件"
task :clean_gems do
  puts "清理所有 .gem 文件..."
  FileList["*.gem"].each do |f|
    rm f
    puts "  删除: #{f}"
  end
  puts "✅ 清理完成"
end

desc "运行所有验证脚本"
task :validate do
  puts "=" * 50
  puts "运行验证脚本"
  puts "=" * 50
  puts

  puts "1. API 一致性验证..."
  sh "ruby scripts/validate_requests.rb"

  puts
  puts "2. 功能测试..."
  sh "ruby scripts/test_request_body_classes.rb"

  puts
  puts "3. 三方交叉验证..."
  sh "ruby scripts/comprehensive_validation.rb"

  puts
  puts "4. 检查废弃接口..."
  sh "ruby scripts/find_deprecated_requests.rb"
end

desc "生成最终验证报告"
task :report do
  sh "ruby scripts/final_validation_report.rb"
end

desc "显示帮助信息"
task :help do
  puts
  puts "可用的 Rake 任务:"
  puts
  puts "  rake build           - 构建 gem 包"
  puts "  rake install         - 构建并安装到系统（Bundler 默认）"
  puts "  rake install_local   - 构建并安装到本地"
  puts "  rake release         - 发布到 RubyGems（需要凭据）"
  puts "  rake clean_gems      - 清理构建的 gem 文件"
  puts "  rake validate        - 运行所有验证脚本"
  puts "  rake report          - 生成最终验证报告"
  puts "  rake help            - 显示此帮助"
  puts
  puts "示例:"
  puts "  bundle exec rake build"
  puts "  bundle exec rake install_local"
  puts "  bundle exec rake validate"
  puts
end

task default: :help
