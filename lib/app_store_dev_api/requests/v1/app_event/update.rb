# frozen_string_literal: true

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
              property :priority
              property :purchaseRequirement
              property :primaryLocale
              property :territorySchedules
              property :eventState
              property :purpose
            end
          end
        end
      end
    end
  end
end