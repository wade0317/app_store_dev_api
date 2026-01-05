# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module MarketplaceWebhook
        class Create < Request::Body
          data do
            type 'marketplaceWebhooks'

            attributes do
              property :endpointUrl, required: true
              property :secret, required: true
            end


          end
        end
      end
    end
  end
end
