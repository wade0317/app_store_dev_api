# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module SubscriptionImage
        class Create < Request::Body
          data do
            type 'subscriptionImages'

            attributes do
              property :fileName, required: true
              property :fileSize, required: true
              property :state, required: true
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