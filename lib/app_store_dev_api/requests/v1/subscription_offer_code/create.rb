module AppStoreDevApi
  module Requests
  module V1
  module SubscriptionOfferCode
    class Create < Request::Body
      data do
        type 'subscriptionOfferCodes'
        attributes do
          property :name, required: true
          property :customerEligibilities, required: true
          property :offerEligibility, required: true
          property :duration, required: true
          property :offerMode, required: true
          property :numberOfPeriods, required: true
          property :autoRenewEnabled
        end
        relationships do
          property :subscription, required: true
          property :prices, required: true
        end
      end
    end
  end
  end
  end
end
