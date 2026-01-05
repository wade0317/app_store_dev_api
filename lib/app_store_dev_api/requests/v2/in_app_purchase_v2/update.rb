# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V2
      module InAppPurchaseV2
        class Update < Request::Body
          data do
            type 'inAppPurchases'

            attributes do
              property :name
              property :reviewNote
              property :familySharable
            end


          end
        end
      end
    end
  end
end
