# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module SubscriptionOfferCodeCustomCode
        class Create < Request::Body

          data do
            type 'subscriptionOfferCodeCustomCodes'

            attributes do
              property :custom_code, required: true
              property :expiration_date
              property :number_of_codes, required: true
            end
          end
          
        end
      end
    end
  end
end
