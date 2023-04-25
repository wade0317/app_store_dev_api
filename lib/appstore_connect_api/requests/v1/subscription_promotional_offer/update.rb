# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module SubscriptionPromotionalOffers
        class Update < Request::Body

          data do
            id
            type 'subscriptionPromotionalOffers'

          end
          
        end
      end
    end
  end
end
