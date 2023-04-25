# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module SubscriptionGroupLocalization
        class Create < Request::Body
          data do

            type 'subscriptionGroupLocalizations'

            attributes do
              property :name
              property :custom_app_name
            end
            
          end
        end
      end
    end
  end
end
