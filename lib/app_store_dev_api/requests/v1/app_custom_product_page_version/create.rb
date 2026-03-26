# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppCustomProductPageVersion
        class Create < Request::Body
          data do
            type 'appCustomProductPageVersions'

            attributes do
              property :deepLink
            end


            relationships do
              property :appCustomProductPage, required: true
              property :appCustomProductPageLocalizations
            end

          end
        end
      end
    end
  end
end
