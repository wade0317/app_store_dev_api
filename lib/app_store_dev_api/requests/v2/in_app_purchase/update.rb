# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V2
      module InAppPurchase
        class Update < Request::Body
          data do
            id
            type 'inAppPurchases'

            attributes do
              property :name
              property :family_sharable
              property :review_note
            end
          end
        end
      end
    end
  end
end
