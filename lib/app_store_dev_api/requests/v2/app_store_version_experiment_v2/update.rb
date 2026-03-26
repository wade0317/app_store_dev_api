# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V2
      module AppStoreVersionExperimentV2
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
