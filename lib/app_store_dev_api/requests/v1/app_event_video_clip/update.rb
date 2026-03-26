# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppEventVideoClip
        class Update < Request::Body
          data do
            id
            type 'appEventVideoClips'

            attributes do
              property :previewFrameTimeCode
              property :uploaded
            end
          end
        end
      end
    end
  end
end