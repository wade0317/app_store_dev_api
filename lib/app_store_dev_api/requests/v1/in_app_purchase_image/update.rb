module AppStoreDevApi
  module Requests
  module V1
  module InAppPurchaseImage
    class Update < Request::Body
      data do
        id
        type 'inAppPurchaseImages'
        attributes do
          property :sourceFileChecksum
          property :uploaded
        end
      end
    end
  end
  end
  end
end
