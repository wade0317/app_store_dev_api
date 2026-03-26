module AppStoreDevApi
  module Requests
  module V1
  module AppStoreReviewDetail
    class Update < Request::Body
      data do
        id
        type 'appStoreReviewDetails'
        attributes do
          property :contactFirstName
          property :contactLastName
          property :contactPhone
          property :contactEmail
          property :demoAccountName
          property :demoAccountPassword
          property :demoAccountRequired
          property :notes
        end
      end
    end
  end
  end
  end
end
