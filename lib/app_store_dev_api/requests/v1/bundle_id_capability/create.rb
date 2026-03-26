module AppStoreDevApi
  module Requests
  module V1
  module BundleIdCapability
    class Create < Request::Body
      data do
        type 'bundleIdCapabilitys'
        attributes do
          property :capabilityType, required: true
          property :settings
        end
        relationships do
          property :bundleId, required: true
        end
      end
    end
  end
  end
  end
end
