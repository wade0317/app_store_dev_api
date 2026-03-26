#!/usr/bin/env ruby
# frozen_string_literal: true

# Request Body 类功能测试

require_relative '../lib/app_store_dev_api'

puts '=' * 80
puts 'Request Body 类功能测试'
puts '=' * 80
puts

# 测试用例
test_cases = [
  # 测试 1: 简单属性（无 relationships）
  {
    name: 'AlternativeDistributionDomain::Create',
    class_name: 'AppStoreDevApi::Requests::V1::AlternativeDistributionDomain::Create',
    params: {
      domain: 'example.com',
      referenceName: 'Test Domain'
    },
    expected_type: 'alternativeDistributionDomains',
    has_relationships: false
  },

  # 测试 2: 带 relationships
  {
    name: 'AppClipAdvancedExperience::Create',
    class_name: 'AppStoreDevApi::Requests::V1::AppClipAdvancedExperience::Create',
    params: {
      link: 'https://example.com',
      isPoweredBy: true,
      defaultLanguage: 'en-US',
      relationships: {
        appClip: { data: { type: 'appClips', id: '123' } },
        headerImage: { data: { type: 'appClipHeaderImages', id: '456' } },
        localizations: { data: [] }
      }
    },
    expected_type: 'appClipAdvancedExperiences',
    has_relationships: true
  },

  # 测试 3: Game Center
  {
    name: 'GameCenterAchievement::Create',
    class_name: 'AppStoreDevApi::Requests::V1::GameCenterAchievement::Create',
    params: {
      referenceName: 'First Win',
      vendorIdentifier: 'achievement_001',
      points: 100,
      showBeforeEarned: true,
      repeatable: false,
      relationships: {
        gameCenterDetail: { data: { type: 'gameCenterDetails', id: 'gc123' } }
      }
    },
    expected_type: 'gameCenterAchievements',
    has_relationships: true
  },

  # 测试 4: V2 API
  {
    name: 'InAppPurchaseV2::Create',
    class_name: 'AppStoreDevApi::Requests::V2::InAppPurchaseV2::Create',
    params: {
      name: 'Premium Subscription',
      productId: 'com.example.premium',
      inAppPurchaseType: 'AUTOMATICALLY_RENEWABLE_SUBSCRIPTION',
      relationships: {
        app: { data: { type: 'apps', id: 'app123' } }
      }
    },
    expected_type: 'inAppPurchases',
    has_relationships: true
  },

  # 测试 5: Marketplace
  {
    name: 'MarketplaceWebhook::Create',
    class_name: 'AppStoreDevApi::Requests::V1::MarketplaceWebhook::Create',
    params: {
      endpointUrl: 'https://api.example.com/webhook',
      secret: 'webhook_secret_key_12345'
    },
    expected_type: 'marketplaceWebhooks',
    has_relationships: false
  },

  # 测试 6: Update 操作
  {
    name: 'GameCenterAchievement::Update',
    class_name: 'AppStoreDevApi::Requests::V1::GameCenterAchievement::Update',
    params: {
      referenceName: 'Updated Achievement'
    },
    expected_type: 'gameCenterAchievements',
    has_relationships: false
  }
]

passed = 0
failed = 0
errors = []

test_cases.each_with_index do |test, idx|
  print "[#{idx + 1}/#{test_cases.size}] #{test[:name]} ... "

  begin
    klass = test[:class_name].constantize
    instance = klass.new(**test[:params])
    data_hash = instance.to_h

    # 验证结构
    unless data_hash[:data]
      errors << "#{test[:name]}: 缺少 :data 键"
      puts '❌'
      failed += 1
      next
    end

    # 验证类型
    actual_type = data_hash[:data][:type]
    if actual_type != test[:expected_type]
      errors << "#{test[:name]}: 类型错误 (期望 #{test[:expected_type]}, 实际 #{actual_type})"
      puts '❌'
      failed += 1
      next
    end

    # 验证属性
    unless data_hash[:data][:attributes]
      errors << "#{test[:name]}: 缺少 attributes"
      puts '❌'
      failed += 1
      next
    end

    # 验证 relationships（如果需要）
    if test[:has_relationships]
      rels = data_hash[:data][:relationships]
      if rels.nil? || rels.empty?
        errors << "#{test[:name]}: relationships 缺失或为空"
        puts '❌'
        failed += 1
        next
      end
    end

    puts '✅'
    passed += 1

  rescue StandardError => e
    puts '❌'
    errors << "#{test[:name]}: #{e.message}"
    failed += 1
  end
end

puts
puts '=' * 80
puts '测试结果'
puts '=' * 80
puts
puts "通过: #{passed}/#{test_cases.size}"
puts "失败: #{failed}/#{test_cases.size}"
puts

if errors.any?
  puts '错误详情:'
  puts
  errors.each do |error|
    puts "  - #{error}"
  end
  puts
end

if failed.zero?
  puts '🎉 所有测试通过！Request Body 类工作正常'
  exit 0
else
  puts '⚠️  部分测试失败，需要修复'
  exit 1
end
