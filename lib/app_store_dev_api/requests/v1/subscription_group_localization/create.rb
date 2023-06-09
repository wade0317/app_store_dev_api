# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module SubscriptionGroupLocalization
        class Create < Request::Body
          data do

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
