# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module App
        class Update < Request::Body
          data do
            id
            type 'apps'

            attributes do
              property :bundle_id
              property :content_rights_declaration
              property :primary_locale
              property :subscription_status_url
              property :subscription_status_url_for_sandbox
              property :subscription_status_url_version
              property :subscription_status_url_version_for_sandbox
              
            end
          end
        end
      end
    end
  end
end
