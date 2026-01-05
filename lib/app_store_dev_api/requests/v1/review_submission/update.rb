module AppStoreDevApi
  module Requests
  module V1
  module ReviewSubmission
    class Update < Request::Body
      data do
        id
        type 'reviewSubmissions'
        attributes do
          property :platform
          property :submitted
          property :canceled
        end
      end
    end
  end
  end
  end
end
