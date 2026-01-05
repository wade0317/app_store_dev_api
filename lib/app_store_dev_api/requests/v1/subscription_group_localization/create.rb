module AppStoreDevApi
  module Requests
  module V1
  module SubscriptionGroupLocalization
    class Create < Request::Body
      data do
        type 'subscriptionGroupLocalizations'
        attributes do
          property :name, required: true
          property :customAppName
          property :locale, required: true
        end
        relationships do
          property :subscriptionGroup, required: true
        end
      end
    end
  end
  end
  end
end
