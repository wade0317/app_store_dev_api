# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module BackgroundAssetUploadFile
        class Create < Request::Body
          data do
            type 'backgroundAssetUploadFiles'

            attributes do
              property :assetType, required: true
              property :fileName, required: true
              property :fileSize, required: true
            end


            relationships do
              property :backgroundAssetVersion, required: true
            end

          end
        end
      end
    end
  end
end
