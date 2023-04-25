# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module SubscriptionGroupLocalization
        class Update < Request::Body
          data do

            id
            type 'subscriptionGroupLocalizations'

            attributes do
              property :name, required: true
              property :locale, required: true
              property :custom_app_name
            end
            
          end
        end
      end
    end
  end
end
