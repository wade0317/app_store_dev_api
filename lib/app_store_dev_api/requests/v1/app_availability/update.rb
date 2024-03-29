# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppAvailability
        class Update < Request::Body
          data do
            
            id

            type 'territoryAvailabilities'

            attributes do
              property :available
              property :pre_order_enabled
              property :release_date
            end

          end
        end
      end
    end
  end
end
