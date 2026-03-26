module AppStoreDevApi
  module Requests
  module V1
  module SubscriptionImage
    class Create < Request::Body
      data do
        type 'subscriptionImages'
        attributes do
          property :fileSize, required: true
          property :fileName, required: true
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
