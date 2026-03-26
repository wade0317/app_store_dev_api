module AppStoreDevApi
  module Requests
  module V1
  module ReviewSubmissionItem
    class Update < Request::Body
      data do
        id
        type 'reviewSubmissionItems'
        attributes do
          property :resolved
          property :removed
        end
      end
    end
  end
  end
  end
end
