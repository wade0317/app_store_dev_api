# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module SubscriptionLocalization
        class Create < Request::Body

          data do
            type 'subscriptionLocalizations'

            attributes do
              property :description
              property :locale, required: true
              property :name, required: true
            end
          end
          
        end
      end
    end
  end
end
