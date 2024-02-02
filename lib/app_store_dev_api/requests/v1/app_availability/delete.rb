# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppAvailability
        class Delete < Request::Body
          data do
            
            type 'endAppAvailabilityPreOrders'
            
            attributes do
              property :available_in_new_territories, required: true
            end

          end
        end
      end
    end
  end
end
