# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V2
      module SandboxTester
        class Update < Request::Body
          data do
            id 
            type 'sandboxTesters'

            attributes do
              property :interrupt_purchases
              property :subscription_renewal_rate
              property :territory
            end
          end
        end
      end
    end
  end
end
