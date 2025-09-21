module AppStoreDevApi
  module Requests
    module V1
      module WebhookDelivery
        class Create < Request::Body
          data do
            type 'webhookDeliveries'
            relationships do
              property :webhook, required: true
            end
          end
        end
      end
    end
  end
end