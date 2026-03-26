module AppStoreDevApi
  module Requests
  module V1
  module InAppPurchaseLocalization
    class Create < Request::Body
      data do
        type 'inAppPurchaseLocalizations'
        attributes do
          property :name, required: true
          property :locale, required: true
          property :description
        end
        relationships do
          property :inAppPurchaseV2, required: true
        end
      end
    end
  end
  end
  end
end
