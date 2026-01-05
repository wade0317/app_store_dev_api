# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module InAppPurchaseOfferCode
        class Create < Request::Body
          data do
            type 'inAppPurchaseOfferCodes'

            attributes do
              property :name, required: true
              property :customerEligibilities, required: true
            end


            relationships do
              property :inAppPurchase, required: true
              property :prices, required: true
            end

          end
        end
      end
    end
  end
end
