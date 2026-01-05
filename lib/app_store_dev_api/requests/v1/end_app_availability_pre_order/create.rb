module AppStoreDevApi
  module Requests
  module V1
  module EndAppAvailabilityPreOrder
    class Create < Request::Body
      data do
        type 'endAppAvailabilityPreOrders'
        relationships do
          property :territoryAvailabilities, required: true
        end
      end
    end
  end
  end
  end
end
