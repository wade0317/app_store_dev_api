module AppStoreDevApi
  module Requests
  module V1
  module InAppPurchaseAvailability
    class Create < Request::Body
      data do
        type 'inAppPurchaseAvailabilitys'
        attributes do
          property :availableInNewTerritories, required: true
        end
        relationships do
          property :inAppPurchase, required: true
          property :availableTerritories, required: true
        end
      end
    end
  end
  end
  end
end
