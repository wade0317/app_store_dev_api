# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module SubscriptionPrices
        class Create < Request::Body
          data do
            type 'subscriptionPrices'

            attributes do
              property :preserve_current_price
              property :start_date
            end
          end
        end
      end
    end
  end
end
