# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module SubscriptionImage
        class Update < Request::Body
          data do
            id
            type 'subscriptionImages'

            attributes do
              property :uploaded
              property :sourceFileChecksum
            end
          end
        end
      end
    end
  end
end