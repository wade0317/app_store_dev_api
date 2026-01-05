# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module InAppPurchaseOfferCodeCustomCode
        class Create < Request::Body
          data do
            type 'inAppPurchaseOfferCodeCustomCodes'

            attributes do
              property :customCode, required: true
              property :numberOfCodes, required: true
              property :expirationDate
            end


            relationships do
              property :offerCode, required: true
            end

          end
        end
      end
    end
  end
end
