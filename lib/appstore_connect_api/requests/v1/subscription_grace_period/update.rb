# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module SubscriptionGracePeriod
        class Update < Request::Body
          data do
            id
            type 'subscriptionGracePeriods'
            
            attributes do
              property :duration
              property :opt_in
              property :renewal_type
              property :sandbox_opt_in
            end
          end
        end
      end
    end
  end
end
