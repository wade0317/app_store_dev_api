module AppStoreDevApi
  module Requests
  module V1
  module InAppPurchaseSubmission
    class Create < Request::Body
      data do
        type 'inAppPurchaseSubmissions'
        relationships do
          property :inAppPurchaseV2, required: true
        end
      end
    end
  end
  end
  end
end
