module AppStoreDevApi
  module Requests
  module V1
  module SubscriptionGroupSubmission
    class Create < Request::Body
      data do
        type 'subscriptionGroupSubmissions'
        relationships do
          property :subscriptionGroup, required: true
        end
      end
    end
  end
  end
  end
end
