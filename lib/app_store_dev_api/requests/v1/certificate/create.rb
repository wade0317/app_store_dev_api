module AppStoreDevApi
  module Requests
  module V1
  module Certificate
    class Create < Request::Body
      data do
        type 'certificates'
        attributes do
          property :csrContent, required: true
          property :certificateType, required: true
        end
        relationships do
          property :merchantId
          property :passTypeId
        end
      end
    end
  end
  end
  end
end
