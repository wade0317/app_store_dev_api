# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module InAppPurchaseAppStoreReviewScreenshot
        class Create < Request::Body
          data do
            type 'inAppPurchaseAppStoreReviewScreenshots'

            attributes do
              property :fileSize, required: true
              property :fileName, required: true
            end


            relationships do
              property :inAppPurchaseV2, required: true
            end

          end
        end
      end
    end
  end
end
