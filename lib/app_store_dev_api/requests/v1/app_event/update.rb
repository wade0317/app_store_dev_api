module AppStoreDevApi
  module Requests
  module V1
  module AppEvent
    class Update < Request::Body
      data do
        id
        type 'appEvents'
        attributes do
          property :referenceName
          property :badge
          property :deepLink
          property :purchaseRequirement
          property :primaryLocale
          property :priority
          property :purpose
          property :territorySchedules
        end
      end
    end
  end
  end
  end
end
