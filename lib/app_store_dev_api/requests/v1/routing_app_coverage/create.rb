# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module RoutingAppCoverage
        class Create < Request::Body
          data do
            type 'routingAppCoverages'

            attributes do
              property :fileName, required: true
              property :fileSize, required: true
            end

            relationships do
              property :appStoreVersion, required: true
            end
          end
        end
      end
    end
  end
end