module AppStoreDevApi
  module Requests
  module V1
  module SubscriptionOfferCodeOneTimeUseCode
    class Create < Request::Body
      data do
        type 'subscriptionOfferCodeOneTimeUseCodes'
        attributes do
          property :numberOfCodes, required: true
          property :expirationDate, required: true
          property :environment
        end
        relationships do
          property :offerCode, required: true
        end
      end
    end
  end
  end
  end
end
