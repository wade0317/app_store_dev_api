# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module SubscriptionAppStoreReviewScreenshot
        class Update < Request::Body
          data do
            id
            type 'subscriptionAppStoreReviewScreenshots'

            attributes do
              property :uploaded
              property :source_file_checksum
            end
          end
        end
      end
    end
  end
end
