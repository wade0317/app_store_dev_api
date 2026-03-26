module AppStoreDevApi
  module Requests
  module V1
  module AppStoreVersion
    class Create < Request::Body
      data do
        type 'appStoreVersions'
        attributes do
          property :platform, required: true
          property :versionString, required: true
          property :copyright
          property :reviewType
          property :releaseType
          property :earliestReleaseDate
          property :usesIdfa
        end
        relationships do
          property :app, required: true
          property :appStoreVersionLocalizations
          property :build
        end
      end
    end
  end
  end
  end
end
