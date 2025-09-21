module AppStoreDevApi
  module Requests
    module V1
      module Webhook
        class Create < Request::Body
          data do
            type 'webhooks'
            attributes do
              property :name, required: true
              property :url, required: true
              property :events, required: true
              property :enabled, default: true
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