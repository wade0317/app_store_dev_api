module AppStoreDevApi
  module Requests
  module V1
  module SubscriptionGroup
    class Update < Request::Body
      data do
        id
        type 'subscriptionGroups'
        attributes do
          property :referenceName
        end
      end
    end
  end
  end
  end
end
