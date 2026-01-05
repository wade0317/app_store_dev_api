module AppStoreDevApi
  module Requests
  module V1
  module AppInfoLocalization
    class Create < Request::Body
      data do
        type 'appInfoLocalizations'
        attributes do
          property :locale, required: true
          property :name, required: true
          property :subtitle
          property :privacyPolicyUrl
          property :privacyChoicesUrl
          property :privacyPolicyText
        end
        relationships do
          property :appInfo, required: true
        end
      end
    end
  end
  end
  end
end
