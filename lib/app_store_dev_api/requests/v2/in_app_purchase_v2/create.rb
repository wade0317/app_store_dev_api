# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V2
      module InAppPurchaseV2
        class Create < Request::Body
          data do
            type 'inAppPurchases'

            attributes do
              property :name, required: true
              property :productId, required: true
              property :inAppPurchaseType, required: true
              property :reviewNote
              property :familySharable
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
