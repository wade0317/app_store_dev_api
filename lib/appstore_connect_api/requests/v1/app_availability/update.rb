# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module AppAvailability
        class Update < Request::Body
          data do
            
            type 'appAvailabilities'

            attributes do
              property :available_in_new_territories, required: true
            end

          end
        end
      end
    end
  end
end
