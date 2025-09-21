# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppStoreReviewAttachment
        class Create < Request::Body
          data do
            type 'appStoreReviewAttachments'

            attributes do
              property :fileName, required: true
              property :fileSize, required: true
            end

            relationships do
              property :app_store_review_detail, required: true
            end
          end
        end
      end
    end
  end
end