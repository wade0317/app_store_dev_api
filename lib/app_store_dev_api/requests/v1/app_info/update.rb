module AppStoreDevApi
  module Requests
  module V1
  module AppInfo
    class Update < Request::Body
      data do
        id
        type 'appInfos'
        relationships do
          property :primaryCategory
          property :primarySubcategoryOne
          property :primarySubcategoryTwo
          property :secondaryCategory
          property :secondarySubcategoryOne
          property :secondarySubcategoryTwo
        end
      end
    end
  end
  end
  end
end
