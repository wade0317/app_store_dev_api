module AppStoreDevApi
  module Requests
  module V1
  module AppEvent
    class Create < Request::Body
      data do
        type 'appEvents'
        attributes do
          property :referenceName, required: true
          property :badge
          property :deepLink
          property :purchaseRequirement
          property :primaryLocale
          property :priority
          property :purpose
          property :territorySchedules
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
