# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module SubscriptionOfferCode
        class Update < Request::Body

          data do
            id
            type 'subscriptionOfferCodes'

            attributes do
              property :active
            end
          end
          
        end
      end
    end
  end
end
