# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module Subscription
        class Create < Request::Body
          data do
            type 'subscriptions'
            
            attributes do
              property :name, required: true
              property :product_id, required: true
              property :family_sharable
              property :review_note
              property :subscription_period
              property :group_level
            end
          end
        end
      end
    end
  end
end
