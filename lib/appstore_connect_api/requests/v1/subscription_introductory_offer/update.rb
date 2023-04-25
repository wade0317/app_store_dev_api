# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module SubscriptionIntroductoryOffer
        class Update < Request::Body

          data do
            id
            type 'subscriptionIntroductoryOffers'

            attributes do
              property :end_date
            end
          end
          
        end
      end
    end
  end
end
