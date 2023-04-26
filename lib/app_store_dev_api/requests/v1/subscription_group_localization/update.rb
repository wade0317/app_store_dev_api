# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module SubscriptionGroupLocalization
        class Update < Request::Body
          data do

            id
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
