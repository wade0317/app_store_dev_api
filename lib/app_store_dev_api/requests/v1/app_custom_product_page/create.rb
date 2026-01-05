# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppCustomProductPage
        class Create < Request::Body
          data do
            type 'appCustomProductPages'

            attributes do
              property :name, required: true
            end


            relationships do
              property :app, required: true
              property :appCustomProductPageVersions
              property :appStoreVersionTemplate
              property :customProductPageTemplate
            end

          end
        end
      end
    end
  end
end
