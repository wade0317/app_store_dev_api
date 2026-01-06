# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module BetaLicenseAgreement
        class Update < Request::Body
          data do
            type 'betaLicenseAgreements'

            attributes do
              property :agreementText
            end


          end
        end
      end
    end
  end
end
