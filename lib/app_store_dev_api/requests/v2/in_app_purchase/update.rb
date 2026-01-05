module AppStoreDevApi
  module Requests
  module V2
  module InAppPurchase
    class Update < Request::Body
      data do
        id
        type 'inAppPurchaseVs'
        attributes do
          property :name
          property :reviewNote
          property :familySharable
        end
      end
    end
  end
  end
  end
end
