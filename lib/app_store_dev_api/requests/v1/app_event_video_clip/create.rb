module AppStoreDevApi
  module Requests
  module V1
  module AppEventVideoClip
    class Create < Request::Body
      data do
        type 'appEventVideoClips'
        attributes do
          property :fileSize, required: true
          property :fileName, required: true
          property :previewFrameTimeCode
          property :appEventAssetType, required: true
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
