# frozen_string_literal: true



module AppStoreDevApi
  module Requests
    module V1
      module BundleIdCapability
        class Create < Request::Body
		    data do
		      type 'bundleIdCapabilities'

		      attributes do
		        property :capability_type, required: true
		      end
		    end
        end
      end
    end
  end
end


