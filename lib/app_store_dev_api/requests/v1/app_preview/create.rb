module AppStoreDevApi
  module Requests
  module V1
  module AppPreview
    class Create < Request::Body
      data do
        type 'appPreviews'
        attributes do
          property :fileSize, required: true
          property :fileName, required: true
          property :previewFrameTimeCode
          property :mimeType
        end
        relationships do
          property :appPreviewSet, required: true
        end
      end
    end
  end
  end
  end
end
