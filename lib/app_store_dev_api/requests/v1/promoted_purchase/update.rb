# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module PromotedPurchase
        class Update < Request::Body
          data do
            type 'promotedPurchases'

            attributes do
              property :visibleForAllUsers
              property :enabled
            end


          end
        end
      end
    end
  end
end
