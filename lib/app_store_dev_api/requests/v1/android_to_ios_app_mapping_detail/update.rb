# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AndroidToIosAppMappingDetail
        class Update < Request::Body
          data do
            type 'androidToIosAppMappingDetails'

            attributes do
              property :packageName
              property :appSigningKeyPublicCertificateSha256Fingerprints
            end


          end
        end
      end
    end
  end
end
