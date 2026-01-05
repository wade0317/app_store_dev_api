module AppStoreDevApi
  module Requests
  module V1
  module SubscriptionPromotionalOffer
    class Create < Request::Body
      data do
        type 'subscriptionPromotionalOffers'
        attributes do
          property :duration, required: true
          property :name, required: true
          property :numberOfPeriods, required: true
          property :offerCode, required: true
          property :offerMode, required: true
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
