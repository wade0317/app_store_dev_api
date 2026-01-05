module AppStoreDevApi
  module Requests
  module V1
  module Subscription
    class Create < Request::Body
      data do
        type 'subscriptions'
        attributes do
          property :name, required: true
          property :productId, required: true
          property :familySharable
          property :subscriptionPeriod
          property :reviewNote
          property :groupLevel
        end
        relationships do
          property :group, required: true
        end
      end
    end
  end
  end
  end
end
