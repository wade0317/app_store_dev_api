module AppStoreDevApi
  module Requests
  module V1
  module BetaBuildLocalization
    class Create < Request::Body
      data do
        type 'betaBuildLocalizations'
        attributes do
          property :whatsNew
          property :locale, required: true
        end
        relationships do
          property :build, required: true
        end
      end
    end
  end
  end
  end
end
