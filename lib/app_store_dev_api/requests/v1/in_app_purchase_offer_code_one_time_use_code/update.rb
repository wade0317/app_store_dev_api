# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module InAppPurchaseOfferCodeOneTimeUseCode
        class Update < Request::Body
          data do
            type 'inAppPurchaseOfferCodeOneTimeUseCodes'

            attributes do
              property :active
            end


          end
        end
      end
    end
  end
end
