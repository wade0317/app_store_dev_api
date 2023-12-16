# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module SubscriptionGroup
        class Update < Request::Body
          data do
            id
            type 'subscriptionGroups'
            
            attributes do
              property :reference_name
            end

          end
        end
      end
    end
  end
end
