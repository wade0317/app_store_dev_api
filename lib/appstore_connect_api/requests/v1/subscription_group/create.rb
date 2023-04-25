# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module SubscriptionGroup
        class Create < Request::Body
          data do
            
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
