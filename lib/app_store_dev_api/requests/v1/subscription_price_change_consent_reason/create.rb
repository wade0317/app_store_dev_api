# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module SubscriptionPriceChangeConsentReason
        class Create < Request::Body
          data do
            type 'subscriptionPriceChangeConsentReasons'

          end
        end
      end
    end
  end
end
