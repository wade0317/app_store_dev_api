module AppStoreDevApi
  module Requests
  module V1
  module SubscriptionAvailability
    class Create < Request::Body
      data do
        type 'subscriptionAvailabilitys'
        attributes do
          property :availableInNewTerritories, required: true
        end
        relationships do
          property :subscription, required: true
          property :availableTerritories, required: true
        end
      end
    end
  end
  end
  end
end
