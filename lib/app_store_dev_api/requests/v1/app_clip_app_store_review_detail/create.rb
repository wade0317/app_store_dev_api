# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppClipAppStoreReviewDetail
        class Create < Request::Body
          data do
            type 'appClipAppStoreReviewDetails'

            attributes do
              property :invocationUrls, required: true
            end

            relationships do
              property :app_clip_default_experience, required: true
            end
          end
        end
      end
    end
  end
end