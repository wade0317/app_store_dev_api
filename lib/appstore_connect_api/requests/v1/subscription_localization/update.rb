# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module SubscriptionLocalization
        class Update < Request::Body

          data do
            id
            type 'subscriptionLocalizations'

            attributes do
              property :description
              property :name
            end
          end
          
        end
      end
    end
  end
end
