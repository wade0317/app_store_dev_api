module AppStoreDevApi
  module Requests
  module V1
  module AppInfoLocalization
    class Update < Request::Body
      data do
        id
        type 'appInfoLocalizations'
        attributes do
          property :name
          property :subtitle
          property :privacyPolicyUrl
          property :privacyChoicesUrl
          property :privacyPolicyText
        end
      end
    end
  end
  end
  end
end
