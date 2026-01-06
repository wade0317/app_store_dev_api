# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module MarketplaceSearchDetail
        class Create < Request::Body
          data do
            type 'marketplaceSearchDetails'

            attributes do
              property :catalogUrl, required: true
            end


            relationships do
              property :app, required: true
            end

          end
        end
      end
    end
  end
end
