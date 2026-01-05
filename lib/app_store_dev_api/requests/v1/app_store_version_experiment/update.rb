# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppStoreVersionExperiment
        class Update < Request::Body
          data do
            type 'appStoreVersionExperiments'

            attributes do
              property :name
              property :trafficProportion
              property :started
            end


          end
        end
      end
    end
  end
end
