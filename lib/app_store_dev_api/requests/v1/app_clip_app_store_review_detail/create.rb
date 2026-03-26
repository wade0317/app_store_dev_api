module AppStoreDevApi
  module Requests
  module V1
  module AppClipAppStoreReviewDetail
    class Create < Request::Body
      data do
        type 'appClipAppStoreReviewDetails'
        attributes do
          property :invocationUrls
        end
        relationships do
          property :appClipDefaultExperience, required: true
        end
      end
    end
  end
  end
  end
end
