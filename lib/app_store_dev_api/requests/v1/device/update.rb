module AppStoreDevApi
  module Requests
    module V1
      module Device
        class Update < Request::Body
          data do
            id
            type 'devices'
            attributes do
              property :name
              property :status
            end
          end
        end
      end
    end
  end
end