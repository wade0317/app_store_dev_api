module AppStoreDevApi
  module Requests
  module V1
  module AppStoreVersionLocalization
    class Create < Request::Body
      data do
        type 'appStoreVersionLocalizations'
        attributes do
          property :description
          property :locale, required: true
          property :keywords
          property :marketingUrl
          property :promotionalText
          property :supportUrl
          property :whatsNew
        end
        relationships do
          property :appStoreVersion, required: true
        end
      end
    end
  end
  end
  end
end
