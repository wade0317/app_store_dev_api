# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module SubscriptionPrice
        class Create < Request::Body
          data do
            type 'subscriptionPrices'

            attributes do
              property :preserve_current_price 
              property :startDate
            end
          end
        end
      end
    end
  end
end
