# frozen_string_literal: true

module AppStoreDevApi
  # Client 使用 Base 的 method_missing 机制动态调度所有 API 方法
  # 所有端点配置从 schema.json 加载
  #
  # 用法:
  #   client = AppStoreDevApi::Client.new(
  #     issuer_id: 'your_issuer_id',
  #     key_id: 'your_key_id',
  #     private_key: private_key_pem
  #   )
  #
  # 所有 API 方法都可用（共 1,210 个方法）:
  #   client.list_apps
  #   client.create_bundle_id(...)
  #   client.delete_user(id: 'user_id')
  #   client.app_info(id: 'app_id')
  #
  # 查看所有可用方法:
  #   client.web_service_endpoint_aliases
  #   # => [:create_accessibility_declaration, :list_apps, ...]
  #
  # 检查方法是否存在:
  #   client.respond_to?(:list_apps)  # => true
  #
  # 方法总数:
  #   client.web_service_endpoint_aliases.size  # => 1210
  #
  # API 文档:
  #   https://developer.apple.com/documentation/appstoreconnectapi
  #
  class Client < Base
    # 所有方法通过 Base#method_missing 动态调度
    # 端点配置从 lib/config/schema_v4.2.json 加载
  end
end
