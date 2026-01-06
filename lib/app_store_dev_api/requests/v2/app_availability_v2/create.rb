# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V2
      module AppAvailabilityV2
        class Create < Request::Body
          data do
            type 'appAvailabilities'

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
