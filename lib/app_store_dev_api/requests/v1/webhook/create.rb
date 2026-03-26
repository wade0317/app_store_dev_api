module AppStoreDevApi
  module Requests
  module V1
  module Webhook
    class Create < Request::Body
      data do
        type 'webhooks'
        attributes do
          property :enabled, required: true
          property :eventTypes, required: true
          property :name, required: true
          property :secret, required: true
          property :url, required: true
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
