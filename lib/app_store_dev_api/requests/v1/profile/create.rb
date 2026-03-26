module AppStoreDevApi
  module Requests
  module V1
  module Profile
    class Create < Request::Body
      data do
        type 'profiles'
        attributes do
          property :name, required: true
          property :profileType, required: true
        end
        relationships do
          property :bundleId, required: true
          property :devices
          property :certificates, required: true
        end
      end
    end
  end
  end
  end
end
