# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module SubscriptionAppStoreReviewScreenshot
        class Create < Request::Body
          data do
            type 'subscriptionAppStoreReviewScreenshots'

            attributes do
              property :fileSize, required: true
              property :fileName, required: true
            end


            relationships do
              property :subscription, required: true
            end

          end
        end
      end
    end
  end
end
