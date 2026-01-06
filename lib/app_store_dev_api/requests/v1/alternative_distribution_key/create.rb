# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AlternativeDistributionKey
        class Create < Request::Body
          data do
            type 'alternativeDistributionKeys'

            attributes do
              property :publicKey, required: true
            end


            relationships do
              property :app
            end

          end
        end
      end
    end
  end
end
