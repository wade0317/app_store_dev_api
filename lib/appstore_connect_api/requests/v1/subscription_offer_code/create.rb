# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module SubscriptionOfferCode
        class Create < Request::Body

          data do
            type 'subscriptionOfferCodes'

            attributes do
              property :customer_eligibilities, required: true
              property :duration, required: true
              property :name, required: true
              property :number_of_periods, required: true
              property :offer_eligibility, required: true
              property :offer_mode, required: true
            end
          end
          
        end
      end
    end
  end
end
