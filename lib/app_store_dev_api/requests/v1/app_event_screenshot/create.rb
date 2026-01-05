# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppEventScreenshot
        class Create < Request::Body
          data do
            type 'appEventScreenshots'

            attributes do
              property :fileSize, required: true
              property :fileName, required: true
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
