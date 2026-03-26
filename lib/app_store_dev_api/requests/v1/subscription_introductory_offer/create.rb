module AppStoreDevApi
  module Requests
  module V1
  module SubscriptionIntroductoryOffer
    class Create < Request::Body
      data do
        type 'subscriptionIntroductoryOffers'
        attributes do
          property :startDate
          property :endDate
          property :duration, required: true
          property :offerMode, required: true
          property :numberOfPeriods, required: true
        end
        relationships do
          property :subscription, required: true
          property :territory
          property :subscriptionPricePoint
        end
      end
    end
  end
  end
  end
end
