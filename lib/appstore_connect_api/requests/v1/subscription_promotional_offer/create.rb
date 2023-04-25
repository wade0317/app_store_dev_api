# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module SubscriptionPromotionalOffers
        class Create < Request::Body

          data do
            type 'subscriptionPromotionalOffers'

            attributes do
              property :duration, required: true
              property :name, required: true
              property :number_of_periods, required: true
              property :offer_code, required: true
              property :offer_mode, required: true
            end
          end
          
        end
      end
    end
  end
end
