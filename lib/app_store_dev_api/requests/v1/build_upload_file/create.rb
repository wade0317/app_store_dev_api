# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module BuildUploadFile
        class Create < Request::Body
          data do
            type 'buildUploadFiles'

            attributes do
              property :assetType, required: true
              property :fileName, required: true
              property :fileSize, required: true
              property :uti, required: true
            end


            relationships do
              property :buildUpload, required: true
            end

          end
        end
      end
    end
  end
end
