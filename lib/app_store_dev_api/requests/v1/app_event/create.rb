# frozen_string_literal: true

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
              property :priority
              property :purchaseRequirement
              property :primaryLocale, required: true
              property :territorySchedules
              property :eventState
              property :purpose
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