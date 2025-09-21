# frozen_string_literal: true

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
              property :startDate
              property :endDate
              property :priority, required: true
            end

            relationships do
              property :subscription, required: true
            end
          end
        end
      end
    end
  end
end