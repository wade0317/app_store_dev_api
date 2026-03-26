# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V2
      module AppStoreVersionExperimentV2
        class Create < Request::Body
          data do
            type 'appStoreVersionExperiments'

            attributes do
              property :name, required: true
              property :platform, required: true
              property :trafficProportion, required: true
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
