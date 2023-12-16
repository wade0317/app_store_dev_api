# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module SubscriptionOfferCodeCustomCode
        class Update < Request::Body

          data do
            id
            type 'subscriptionOfferCodeCustomCodes'

            attributes do
              property :active
            end
          end
          
        end
      end
    end
  end
end
