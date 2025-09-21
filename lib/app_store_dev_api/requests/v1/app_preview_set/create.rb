# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppPreviewSet
        class Create < Request::Body
          data do
            type 'appPreviewSets'

            attributes do
              property :previewType, required: true
            end

            relationships do
              property :appStoreVersionLocalization
              property :appCustomProductPageLocalization
              property :appStoreVersionExperimentTreatmentLocalization
            end
          end
        end
      end
    end
  end
end