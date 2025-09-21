# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module EndUserLicenseAgreement
        class Update < Request::Body
          data do
            id
            type 'endUserLicenseAgreements'

            attributes do
              property :agreementText
            end

            relationships do
              property :territories
            end
          end
        end
      end
    end
  end
end