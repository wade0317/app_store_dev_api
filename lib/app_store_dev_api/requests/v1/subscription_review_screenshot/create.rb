# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module SubscriptionReviewScreenshot
        class Create < Request::Body
          data do
            type 'subscriptionAppStoreReviewScreenshots'

            attributes do
              property :file_name, required: true
              property :file_size, required: true
            end
          end
        end
      end
    end
  end
end
