# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module InAppPurchaseImage
        class Create < Request::Body
          data do
            type 'inAppPurchaseImages'

            attributes do
              property :fileName, required: true
              property :fileSize, required: true
            end

            relationships do
              property :inAppPurchase, required: true
            end
          end
        end
      end
    end
  end
end