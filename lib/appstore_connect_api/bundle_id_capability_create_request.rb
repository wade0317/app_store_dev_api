# frozen_string_literal: true

module AppStoreConnectApi
  class BundleIdCapabilityCreateRequest < Request::Body
    data do
      type 'bundleIdCapabilities'

      attributes do
        property :capability_type, required: true
      end
    end
  end
end
