# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module MarketplaceSearchDetail
        class Update < Request::Body
          data do
            type 'marketplaceSearchDetails'

            attributes do
              property :catalogUrl
            end


          end
        end
      end
    end
  end
end
