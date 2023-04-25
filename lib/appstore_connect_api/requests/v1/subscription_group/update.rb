# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module SubscriptionGroup
        class Update < Request::Body
          data do
            id
            type 'subscriptionGroups'
            
            attributes do
              property :reference_name, required: true
            end

          end
        end
      end
    end
  end
end
