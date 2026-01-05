# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module InAppPurchaseOfferCodeCustomCode
        class Update < Request::Body
          data do
            type 'inAppPurchaseOfferCodeCustomCodes'

            attributes do
              property :active
            end


          end
        end
      end
    end
  end
end
