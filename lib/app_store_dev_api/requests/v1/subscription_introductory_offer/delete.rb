# frozen_string_literal: true


module AppStoreDevApi
  module Requests
    module V1
      module SubscriptionIntroductoryOffer
        class Delete < Request::Body

          data(Array) do
            id
            type 'subscriptionIntroductoryOffers'
          end
          
        end
      end
    end
  end
end
