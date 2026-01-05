module AppStoreDevApi
  module Requests
  module V1
  module SubscriptionGracePeriod
    class Update < Request::Body
      data do
        id
        type 'subscriptionGracePeriods'
        attributes do
          property :optIn
          property :sandboxOptIn
          property :duration
          property :renewalType
        end
      end
    end
  end
  end
  end
end
