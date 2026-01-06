# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module SubscriptionAppStoreReviewScreenshot
        class Update < Request::Body
          data do
            type 'subscriptionAppStoreReviewScreenshots'

            attributes do
              property :sourceFileChecksum
              property :uploaded
            end


          end
        end
      end
    end
  end
end
