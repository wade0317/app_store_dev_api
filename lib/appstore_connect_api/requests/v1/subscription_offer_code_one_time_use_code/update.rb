# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module AutoRenewableSubscriptionOfferCodeOneTimeUseCode
        class Update < Request::Body

          data do
            id
            type 'subscriptionOfferCodeOneTimeUseCodes'

            attributes do
              property :active
            end
          end
          
        end
      end
    end
  end
end
