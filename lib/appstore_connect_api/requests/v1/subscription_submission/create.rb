# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module SubscriptionSubmission
        class Create < Request::Body
          data do
            type 'subscriptionSubmissions'
          end
        end
      end
    end
  end
end
