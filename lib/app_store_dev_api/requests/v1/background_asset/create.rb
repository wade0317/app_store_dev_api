module AppStoreDevApi
  module Requests
  module V1
  module BackgroundAsset
    class Create < Request::Body
      data do
        type 'backgroundAssets'
        attributes do
          property :assetPackIdentifier, required: true
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
