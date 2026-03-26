module AppStoreDevApi
  module Requests
  module V1
  module Webhook
    class Update < Request::Body
      data do
        id
        type 'webhooks'
        attributes do
          property :enabled
          property :eventTypes
          property :name
          property :secret
          property :url
        end
      end
    end
  end
  end
  end
end
