module AppStoreDevApi
  module Requests
  module V2
  module AppAvailability
    class Create < Request::Body
      data do
        type 'appAvailabilityVs'
        attributes do
          property :availableInNewTerritories, required: true
        end
        relationships do
          property :app, required: true
          property :territoryAvailabilities, required: true
        end
      end
    end
  end
  end
  end
end
