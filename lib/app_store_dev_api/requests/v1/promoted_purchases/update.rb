# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module PromotedPurchases
        class Update < Request::Body
          data do
            id 
            type 'promotedPurchases'

            attributes do
              property :enabled
              property :visible_for_all_users
            end
          end
        end
      end
    end
  end
end
