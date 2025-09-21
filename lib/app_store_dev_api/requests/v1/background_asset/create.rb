module AppStoreDevApi
  module Requests
    module V1
      module BackgroundAsset
        class Create < Request::Body
          data do
            type 'backgroundAssets'
            attributes do
              property :fileName, required: true
              property :fileSize, required: true
              property :sourceFileChecksum, required: true
              property :assetDeliveryState
            end
            relationships do
              property :app, required: true
            end
          end
        end
      end
    end
  end
end