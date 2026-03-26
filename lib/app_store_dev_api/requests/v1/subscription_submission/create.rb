module AppStoreDevApi
  module Requests
  module V1
  module SubscriptionSubmission
    class Create < Request::Body
      data do
        type 'subscriptionSubmissions'
        relationships do
          property :subscription, required: true
        end
      end
    end
  end
  end
  end
end
