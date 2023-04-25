# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module SubscriptionGroupSubmission
        class Create < Request::Body
          
          data do
            type 'subscriptionGroupSubmissions'
          end

        end
      end
    end
  end
end
