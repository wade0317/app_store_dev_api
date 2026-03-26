module AppStoreDevApi
  module Requests
  module V1
  module SubscriptionGroup
    class Create < Request::Body
      data do
        type 'subscriptionGroups'
        attributes do
          property :referenceName, required: true
        end
        relationships do
          property :app, required: true
        end
      end
    end
  end
  end
  end
end
