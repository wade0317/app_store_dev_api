# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module Nomination
        class Create < Request::Body
          data do
            type 'nominations'

            attributes do
              property :name, required: true
              property :type, required: true
              property :description, required: true
              property :submitted, required: true
              property :publishStartDate, required: true
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
              property :relatedApps, required: true
              property :inAppEvents
              property :supportedTerritories
            end

          end
        end
      end
    end
  end
end
