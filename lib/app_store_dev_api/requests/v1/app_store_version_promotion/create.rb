module AppStoreDevApi
  module Requests
  module V1
  module AppStoreVersionPromotion
    class Create < Request::Body
      data do
        type 'appStoreVersionPromotions'
        relationships do
          property :appStoreVersion, required: true
          property :appStoreVersionExperimentTreatment, required: true
        end
      end
    end
  end
  end
  end
end
