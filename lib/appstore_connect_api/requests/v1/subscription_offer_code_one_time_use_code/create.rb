# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module SubscriptionOfferCodeOneTimeUseCode
        class Create < Request::Body

          data do
            type 'subscriptionOfferCodeOneTimeUseCodes'

            attributes do
              property :expiration_date, required: true
              property :number_of_codes, required: true
            end
          end
          
        end
      end
    end
  end
end
