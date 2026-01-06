# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module MarketplaceWebhook
        class Update < Request::Body
          data do
            type 'marketplaceWebhooks'

            attributes do
              property :endpointUrl
              property :secret
            end


          end
        end
      end
    end
  end
end
