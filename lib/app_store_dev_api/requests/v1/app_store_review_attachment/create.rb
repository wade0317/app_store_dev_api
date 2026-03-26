module AppStoreDevApi
  module Requests
  module V1
  module AppStoreReviewAttachment
    class Create < Request::Body
      data do
        type 'appStoreReviewAttachments'
        attributes do
          property :fileSize, required: true
          property :fileName, required: true
        end
        relationships do
          property :appStoreReviewDetail, required: true
        end
      end
    end
  end
  end
  end
end
