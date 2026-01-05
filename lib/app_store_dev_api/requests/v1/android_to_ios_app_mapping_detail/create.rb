# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AndroidToIosAppMappingDetail
        class Create < Request::Body
          data do
            type 'androidToIosAppMappingDetails'

            attributes do
              property :packageName, required: true
              property :appSigningKeyPublicCertificateSha256Fingerprints, required: true
            end


            relationships do
              property :app, required: true
            end

          end
        end
      end
    end
  end
end
