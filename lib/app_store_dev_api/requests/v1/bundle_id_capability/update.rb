module AppStoreDevApi
  module Requests
  module V1
  module BundleIdCapability
    class Update < Request::Body
      data do
        id
        type 'bundleIdCapabilitys'
        attributes do
          property :capabilityType
          property :settings
        end
      end
    end
  end
  end
  end
end
