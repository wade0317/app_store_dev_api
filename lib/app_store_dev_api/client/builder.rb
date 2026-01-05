# frozen_string_literal: true

require 'json'
require 'active_support/core_ext/hash'

# ⚠️  注意：此 Builder 类已不再使用
#
# Client 现在完全使用动态方法调度（method_missing），无需预生成方法。
#
# 此 Builder 类保留用于以下可选场景：
# 1. IDE 自动补全支持 - 生成方法定义供 IDE 解析
# 2. 类型检查工具 - 生成方法签名供 Sorbet/Steep 使用
# 3. 文档生成 - 生成完整的方法列表文档
#
# 默认情况下不使用，Client 直接继承 Base 使用动态调度。
#
# 如需生成（可选）：
#   ruby -r ./lib/app_store_dev_api/client/builder.rb \
#     -e "AppStoreDevApi::Client::Builder.new.write"
#
# 生成后的文件：
#   lib/app_store_dev_api/client_generated.rb (不会覆盖 client.rb)
#
module AppStoreDevApi
  class Client
    class Builder
      TEMPLATE = <<~'SOURCE'
        # frozen_string_literal: true

        # WARNING ABOUT GENERATED CODE
        #
        # This file is generated.
        #
        # WARNING ABOUT GENERATED CODE
        #

        module AppStoreDevApi
          class Client < Base
            <%- web_service_endpoints.each do |web_service_endpoint| -%>
            #
            # @see <%= web_service_endpoint.delete(:see) %>
            #
            def <%= web_service_endpoint.delete(:alias) -%>(**kwargs)
              web_service_endpoint = Schema::WebServiceEndpoint.new(
                <%= web_service_endpoint.sort.to_h %>
              )

              call(web_service_endpoint, **kwargs)
            end

            <%- end -%>
          end
        end
      SOURCE
      private_constant :TEMPLATE

      def web_service_endpoints
        @web_service_endpoints ||= begin
          schema_content = File.read(schema_path)
          schema = JSON.parse(schema_content)
          
          schema['web_service_endpoints'].map do |endpoint|
            endpoint.symbolize_keys.tap do |ep|
              ep[:see] ||= 'https://developer.apple.com/documentation/appstoreconnectapi'
            end
          end
        end
      end

      def write(output_file = 'lib/app_store_dev_api/client_generated.rb')
        File.write(output_file, source)
        puts "✅ 已生成方法定义到: #{output_file}"
        puts "⚠️  注意: 这是可选的生成文件，仅用于 IDE 支持"
        puts "   默认使用动态调度，无需此文件"
      end

      def source
        @source ||= begin
          require 'erb'

          erb = ERB.new(TEMPLATE, trim_mode: '%-')

          erb.result(binding)
        end

        @source
      end

      private

      def schema_path
        File.join(Dir.pwd, 'lib/config/schema_v4.2.json')
      end
    end
  end
end
