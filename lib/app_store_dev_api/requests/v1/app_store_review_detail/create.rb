module AppStoreDevApi
  module Requests
  module V1
  module AppStoreReviewDetail
    class Create < Request::Body
      data do
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
        relationships do
          property :appStoreVersion, required: true
        end
      end
    end
  end
  end
  end
end
