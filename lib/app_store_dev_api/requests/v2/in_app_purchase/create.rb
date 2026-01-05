module AppStoreDevApi
  module Requests
  module V2
  module InAppPurchase
    class Create < Request::Body
      data do
        type 'inAppPurchaseVs'
        attributes do
          property :name, required: true
          property :productId, required: true
          property :inAppPurchaseType, required: true
          property :reviewNote
          property :familySharable
        end
        relationships do
          property :app, required: true
        end
      end
    end
  end
  end
  end
end
