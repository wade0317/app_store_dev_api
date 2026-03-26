module AppStoreDevApi
  module Requests
  module V1
  module SubscriptionIntroductoryOffer
    class Update < Request::Body
      data do
        id
        type 'subscriptionIntroductoryOffers'
        attributes do
          property :endDate
        end
      end
    end
  end
  end
  end
end
