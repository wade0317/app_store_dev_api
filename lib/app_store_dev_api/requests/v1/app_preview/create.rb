# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppPreview
        class Create < Request::Body
          data do
            type 'appPreviews'

            attributes do
              property :fileName, required: true
              property :fileSize, required: true
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