module AppStoreDevApi
  module Requests
    module V1
      module Webhook
        class Update < Request::Body
          data do
            id
            type 'webhooks'
            attributes do
              property :name
              property :url
              property :events
              property :enabled
            end
          end
        end
      end
    end
  end
end