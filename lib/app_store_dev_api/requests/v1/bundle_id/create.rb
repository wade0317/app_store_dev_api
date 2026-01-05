module AppStoreDevApi
  module Requests
  module V1
  module BundleId
    class Create < Request::Body
      data do
        type 'bundleIds'
        attributes do
          property :name, required: true
          property :platform, required: true
          property :identifier, required: true
          property :seedId
        end
      end
    end
  end
  end
  end
end
