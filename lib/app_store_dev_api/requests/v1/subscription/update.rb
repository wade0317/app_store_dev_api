# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module Subscription
        class Update < Request::Body
          data do
            id 
            type 'subscriptions'

            attributes do
              property :name
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
