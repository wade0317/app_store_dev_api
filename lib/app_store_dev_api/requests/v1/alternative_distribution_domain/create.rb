# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AlternativeDistributionDomain
        class Create < Request::Body
          data do
            type 'alternativeDistributionDomains'

            attributes do
              property :domain, required: true
              property :referenceName, required: true
            end


          end
        end
      end
    end
  end
end
