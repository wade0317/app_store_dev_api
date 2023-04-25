# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module AppInfoLocalizations
        class Update < Request::Body
          data do
            id
            type 'appInfoLocalizations'

            attributes do
              property :description
              property :keywords
              property :marketing_url
              property :promotional_text
              property :support_url
              property :whats_new
            end
          end
        end
      end
    end
  end
end
