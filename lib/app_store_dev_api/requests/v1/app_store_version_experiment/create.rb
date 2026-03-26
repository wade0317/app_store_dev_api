# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppStoreVersionExperiment
        class Create < Request::Body
          data do
            type 'appStoreVersionExperiments'

            attributes do
              property :name, required: true
              property :trafficProportion, required: true
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
