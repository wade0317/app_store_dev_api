# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module TerritoryAvailability
        class Update < Request::Body
          data do
            id
            type 'territoryAvailabilities'

            attributes do
              property :available
              property :releaseDate
              property :preOrderEnabled
            end
          end
        end
      end
    end
  end
end