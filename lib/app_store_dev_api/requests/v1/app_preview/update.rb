# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppPreview
        class Update < Request::Body
          data do
            id
            type 'appPreviews'

            attributes do
              property :sourceFileChecksum
              property :previewFrameTimeCode
              property :uploaded
            end
          end
        end
      end
    end
  end
end