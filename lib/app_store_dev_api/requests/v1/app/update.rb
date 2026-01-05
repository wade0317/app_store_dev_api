module AppStoreDevApi
  module Requests
  module V1
  module App
    class Update < Request::Body
      data do
        id
        type 'apps'
        attributes do
          property :accessibilityUrl
          property :bundleId
          property :primaryLocale
          property :subscriptionStatusUrl
          property :subscriptionStatusUrlVersion
          property :subscriptionStatusUrlForSandbox
          property :subscriptionStatusUrlVersionForSandbox
          property :contentRightsDeclaration
          property :streamlinedPurchasingEnabled
        end
      end
    end
  end
  end
  end
end
