# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module InAppPurchaseImage
        class Update < Request::Body
          data do
            id
            type 'inAppPurchaseImages'

            attributes do
              property :uploaded
              property :sourceFileChecksum
              property :state
            end
          end
        end
      end
    end
  end
end