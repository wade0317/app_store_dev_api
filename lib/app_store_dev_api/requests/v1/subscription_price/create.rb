module AppStoreDevApi
  module Requests
  module V1
  module SubscriptionPrice
    class Create < Request::Body
      data do
        type 'subscriptionPrices'
        attributes do
          property :startDate
          property :preserveCurrentPrice
        end
        relationships do
          property :subscription, required: true
          property :territory
          property :subscriptionPricePoint, required: true
        end
      end
    end
  end
  end
  end
end
