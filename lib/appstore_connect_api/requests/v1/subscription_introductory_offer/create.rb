# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module SubscriptionIntroductoryOffer
        class Create < Request::Body

          data do
            type 'subscriptionIntroductoryOffers'

            attributes do
              property :duration, required: true
              property :end_date
              property :number_of_periods, required: true
              property :offer_mode, required: true
              property :start_date
            end
          end
          
        end
      end
    end
  end
end
