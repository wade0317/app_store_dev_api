module AppStoreDevApi
  module Requests
    module V1
      module Certificate
        class Update < Request::Body
          data do
            id
            type 'certificates'
            attributes do
              property :certificateType
            end
          end
        end
      end
    end
  end
end