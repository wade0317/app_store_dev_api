# frozen_string_literal: true

# WARNING ABOUT GENERATED CODE
#
# This file is generated.
#
# WARNING ABOUT GENERATED CODE

module AppStoreDevApi
  class Client < Base
    #
    # @see https://developer.apple.com/documentation/appstoreconnectapi
    #
    def create_certificate(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_body_type: 'Requests::V1::Certificate::Create', http_method: 'post', url: 'https://api.appstoreconnect.apple.com/v1/certificates' }
      )

      call(web_service_endpoint, **kwargs)
    end

    #
    # @see https://developer.apple.com/documentation/appstoreconnectapi
    #
    def delete_visible_app(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'delete', url: 'https://api.appstoreconnect.apple.com/v1/users/{id}/relationships/visibleApps' }
      )

      call(web_service_endpoint, **kwargs)
    end

    #
    # @see https://developer.apple.com/documentation/appstoreconnectapi/register_a_new_bundle_id
    #
    def create_bundle_id(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_body_type: 'Requests::V1::BundleId::Create', http_method: 'post', url: 'https://api.appstoreconnect.apple.com/v1/bundleIds' }
      )

      call(web_service_endpoint, **kwargs)
    end

    #
    # @see https://developer.apple.com/documentation/appstoreconnectapi
    #
    def create_bundle_id_capability(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_body_type: 'Requests::V1::BundleIdCapability::Create', http_method: 'post', url: 'https://api.appstoreconnect.apple.com/v1/bundleIdCapabilities' }
      )

      call(web_service_endpoint, **kwargs)
    end

    #
    # @see https://developer.apple.com/documentation/appstoreconnectapi
    #
    def create_beta_build_localization(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_body_type: 'Requests::V1::BetaBuildLocalization::Create', http_method: 'post', url: 'https://api.appstoreconnect.apple.com/v1/betaBuildLocalizations' }
      )

      call(web_service_endpoint, **kwargs)
    end
  end
end
