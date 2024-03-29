# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V2
      module InAppPurchase
        class Create < Request::Body
          data do
            type 'inAppPurchases'

            attributes do
              property :name, required: true
              property :product_id, required: true
              property :in_app_purchase_type, required: true
              property :family_sharable
              property :review_note
            end
                        
          end
        end
      end
    end
  end
end
