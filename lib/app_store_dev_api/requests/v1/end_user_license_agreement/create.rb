# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module EndUserLicenseAgreement
        class Create < Request::Body
          data do
            type 'endUserLicenseAgreements'

            attributes do
              property :agreementText, required: true
            end

            relationships do
              property :app, required: true
              property :territories, required: true
            end
          end
        end
      end
    end
  end
end