module AppStoreDevApi
  module Requests
  module V1
  module AppStoreVersion
    class Update < Request::Body
      data do
        id
        type 'appStoreVersions'
        attributes do
          property :versionString
          property :copyright
          property :reviewType
          property :releaseType
          property :earliestReleaseDate
          property :usesIdfa
          property :downloadable
        end
        relationships do
          property :build
          property :appClipDefaultExperience
        end
      end
    end
  end
  end
  end
end
