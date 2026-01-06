# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppStoreVersionExperimentTreatment
        class Update < Request::Body
          data do
            type 'appStoreVersionExperimentTreatments'

            attributes do
              property :name
              property :appIconName
            end


          end
        end
      end
    end
  end
end
