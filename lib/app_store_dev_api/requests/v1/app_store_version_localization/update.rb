module AppStoreDevApi
  module Requests
  module V1
  module AppStoreVersionLocalization
    class Update < Request::Body
      data do
        id
        type 'appStoreVersionLocalizations'
        attributes do
          property :description
          property :keywords
          property :marketingUrl
          property :promotionalText
          property :supportUrl
          property :whatsNew
        end
      end
    end
  end
  end
  end
end
