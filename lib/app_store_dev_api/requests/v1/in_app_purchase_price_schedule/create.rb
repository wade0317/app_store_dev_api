module AppStoreDevApi
  module Requests
  module V1
  module InAppPurchasePriceSchedule
    class Create < Request::Body
      data do
        type 'inAppPurchasePriceSchedules'
        relationships do
          property :inAppPurchase, required: true
          property :baseTerritory, required: true
          property :manualPrices, required: true
        end
      end
    end
  end
  end
  end
end
