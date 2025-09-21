module AppStoreDevApi
  module Requests
    module V1
      module BackgroundAssetVersion
        class Create < Request::Body
          data do
            type 'backgroundAssetVersions'
            attributes do
              property :platform, required: true
              property :minimumOsVersion
              property :maximumOsVersion
            end
            relationships do
              property :backgroundAsset, required: true
            end
          end
        end
      end
    end
  end
end