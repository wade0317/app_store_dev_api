module AppStoreDevApi
  module Requests
  module V1
  module WebhookDelivery
    class Create < Request::Body
      data do
        type 'webhookDeliverys'
        relationships do
          property :template, required: true
        end
      end
    end
  end
  end
  end
end
