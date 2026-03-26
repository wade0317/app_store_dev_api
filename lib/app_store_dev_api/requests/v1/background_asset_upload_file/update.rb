# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module BackgroundAssetUploadFile
        class Update < Request::Body
          data do
            type 'backgroundAssetUploadFiles'

            attributes do
              property :sourceFileChecksum
              property :sourceFileChecksums
              property :uploaded
            end


          end
        end
      end
    end
  end
end
