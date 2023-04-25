# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module Subscription
        class Update < Request::Body
          data do
            id 
            type 'subscriptions'

            attributes do
              property :name, required: true
              property :available_in_all_territories
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
