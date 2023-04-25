# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module InAppPurchaseTerritorie
        class Create < Request::Body
          data do
            type 'inAppPurchaseAvailabilities'

            attributes do
              property :available_in_new_territories, required: true
            end
          end
        end
      end
    end
  end
end
