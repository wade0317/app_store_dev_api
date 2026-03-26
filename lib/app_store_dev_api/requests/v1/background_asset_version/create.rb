module AppStoreDevApi
  module Requests
  module V1
  module BackgroundAssetVersion
    class Create < Request::Body
      data do
        type 'backgroundAssetVersions'
        relationships do
          property :backgroundAsset, required: true
        end
      end
    end
  end
  end
  end
end
