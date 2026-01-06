# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module PromotedPurchase
        class Create < Request::Body
          data do
            type 'promotedPurchases'

            attributes do
              property :visibleForAllUsers, required: true
              property :enabled
            end


            relationships do
              property :app, required: true
              property :inAppPurchaseV2
              property :subscription
            end

          end
        end
      end
    end
  end
end
