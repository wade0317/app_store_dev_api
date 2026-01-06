# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module Nomination
        class Update < Request::Body
          data do
            type 'nominations'

            attributes do
              property :name
              property :type
              property :description
              property :submitted
              property :archived
              property :publishStartDate
              property :publishEndDate
              property :deviceFamilies
              property :locales
              property :supplementalMaterialsUris
              property :hasInAppEvents
              property :launchInSelectMarketsFirst
              property :notes
              property :preOrderEnabled
            end


            relationships do
              property :relatedApps
              property :inAppEvents
              property :supportedTerritories
            end

          end
        end
      end
    end
  end
end
