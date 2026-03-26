# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppStoreVersionExperimentTreatment
        class Create < Request::Body
          data do
            type 'appStoreVersionExperimentTreatments'

            attributes do
              property :name, required: true
              property :appIconName
            end


            relationships do
              property :appStoreVersionExperiment
              property :appStoreVersionExperimentV2
            end

          end
        end
      end
    end
  end
end
