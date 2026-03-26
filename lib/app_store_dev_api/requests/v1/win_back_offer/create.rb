module AppStoreDevApi
  module Requests
  module V1
  module WinBackOffer
    class Create < Request::Body
      data do
        type 'winBackOffers'
        attributes do
          property :referenceName, required: true
          property :offerId, required: true
          property :duration, required: true
          property :offerMode, required: true
          property :periodCount, required: true
          property :customerEligibilityPaidSubscriptionDurationInMonths, required: true
          property :customerEligibilityTimeSinceLastSubscribedInMonths, required: true
          property :customerEligibilityWaitBetweenOffersInMonths
          property :startDate, required: true
          property :endDate
          property :priority, required: true
          property :promotionIntent
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
