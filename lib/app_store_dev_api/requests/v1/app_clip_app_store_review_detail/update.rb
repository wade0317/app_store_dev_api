# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppClipAppStoreReviewDetail
        class Update < Request::Body
          data do
            id
            type 'appClipAppStoreReviewDetails'

            attributes do
              property :invocationUrls
            end
          end
        end
      end
    end
  end
end