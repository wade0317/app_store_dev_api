module AppStoreDevApi
  module Requests
  module V1
  module BuildBetaDetail
    class Update < Request::Body
      data do
        id
        type 'buildBetaDetails'
        attributes do
          property :autoNotifyEnabled
        end
      end
    end
  end
  end
  end
end
