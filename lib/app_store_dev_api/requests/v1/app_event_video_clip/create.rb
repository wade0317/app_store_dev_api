# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppEventVideoClip
        class Create < Request::Body
          data do
            type 'appEventVideoClips'

            attributes do
              property :fileName, required: true
              property :fileSize, required: true
              property :previewFrameTimeCode
              property :previewImage
              property :uploadOperations
              property :assetDeliveryState
            end

            relationships do
              property :appEventLocalization, required: true
            end
          end
        end
      end
    end
  end
end