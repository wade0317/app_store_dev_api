# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module InAppPurchaseOfferCodeOneTimeUseCode
        class Create < Request::Body
          data do
            type 'inAppPurchaseOfferCodeOneTimeUseCodes'

            attributes do
              property :numberOfCodes, required: true
              property :expirationDate, required: true
              property :environment
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
