# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module InAppPurchaseOfferCode
        class Update < Request::Body
          data do
            type 'inAppPurchaseOfferCodes'

            attributes do
              property :active
            end


          end
        end
      end
    end
  end
end
