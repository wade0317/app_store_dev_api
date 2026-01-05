module AppStoreDevApi
  module Requests
  module V1
  module Subscription
    class Update < Request::Body
      data do
        id
        type 'subscriptions'
        attributes do
          property :name
          property :familySharable
          property :subscriptionPeriod
          property :reviewNote
          property :groupLevel
        end
        relationships do
          property :introductoryOffers
          property :promotionalOffers
          property :prices
        end
      end
    end
  end
  end
  end
end
