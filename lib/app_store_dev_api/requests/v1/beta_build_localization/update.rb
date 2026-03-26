module AppStoreDevApi
  module Requests
  module V1
  module BetaBuildLocalization
    class Update < Request::Body
      data do
        id
        type 'betaBuildLocalizations'
        attributes do
          property :whatsNew
        end
      end
    end
  end
  end
  end
end
