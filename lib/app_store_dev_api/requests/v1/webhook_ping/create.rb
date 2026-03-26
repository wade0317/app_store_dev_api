module AppStoreDevApi
  module Requests
    module V1
      module WebhookPing
        class Create < Request::Body
          data do
            type 'webhookPings'
            relationships do
              property :webhook, required: true
            end
          end
        end
      end
    end
  end
end