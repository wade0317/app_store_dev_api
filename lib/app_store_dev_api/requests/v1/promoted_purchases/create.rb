# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module PromotedPurchases
        class Create < Request::Body
          data do
            type 'promotedPurchases'
            
            attributes do
              property :enabled
              property :visible_for_all_users, required: true
            end
          end
        end
      end
    end
  end
end
