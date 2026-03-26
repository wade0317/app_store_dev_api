module AppStoreDevApi
  module Requests
  module V1
  module SubscriptionLocalization
    class Create < Request::Body
      data do
        type 'subscriptionLocalizations'
        attributes do
          property :name, required: true
          property :locale, required: true
          property :description
        end
        relationships do
          property :subscription, required: true
        end
      end
    end
  end
  end
  end
end
