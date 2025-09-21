# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module BillingGracePeriod
        class Update < Request::Body
          data do
            type 'billingGracePeriods'

            attributes do
              property :optIn, required: true
            end
          end
        end
      end
    end
  end
end