# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module SubscriptionAvailability
        class Create < Request::Body
          data do
            type 'subscriptionAvailabilities'
            
            attributes do
              property :available_in_new_territories, required: true
            end
          end
        end
      end
    end
  end
end
