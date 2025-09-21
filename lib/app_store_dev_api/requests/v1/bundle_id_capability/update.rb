module AppStoreDevApi
  module Requests
    module V1
      module BundleIdCapability
        class Update < Request::Body
          data do
            id
            type 'bundleIdCapabilities'
            attributes do
              property :capability_type
              property :settings
            end
          end
        end
      end
    end
  end
end