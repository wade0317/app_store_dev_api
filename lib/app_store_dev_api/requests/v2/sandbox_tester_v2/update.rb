# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V2
      module SandboxTesterV2
        class Update < Request::Body
          data do
            type 'sandboxTesters'

            attributes do
              property :territory
              property :interruptPurchases
              property :subscriptionRenewalRate
            end


          end
        end
      end
    end
  end
end
