module AppStoreDevApi
  module Requests
  module V1
  module SubscriptionPromotionalOffer
    class Update < Request::Body
      data do
        id
        type 'subscriptionPromotionalOffers'
        relationships do
          property :prices
        end
      end
    end
  end
  end
  end
end
