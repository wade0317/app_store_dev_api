# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppScreenshot
        class Create < Request::Body
          data do
            type 'appScreenshots'

            attributes do
              property :fileName, required: true
              property :fileSize, required: true
            end

            relationships do
              property :appScreenshotSet, required: true
            end
          end
        end
      end
    end
  end
end