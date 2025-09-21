# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module WinBackOffer
        class Update < Request::Body
          data do
            id
            type 'winBackOffers'

            attributes do
              property :customerEligibilityPaidSubscriptionDurationInMonths
              property :customerEligibilityTimeSinceLastSubscribedInMonths
              property :customerEligibilityWaitBetweenOffersInMonths
              property :startDate
              property :endDate
              property :priority
            end
          end
        end
      end
    end
  end
end