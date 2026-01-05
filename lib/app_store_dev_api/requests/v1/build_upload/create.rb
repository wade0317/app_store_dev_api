# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module BuildUpload
        class Create < Request::Body
          data do
            type 'buildUploads'

            attributes do
              property :cfBundleShortVersionString, required: true
              property :cfBundleVersion, required: true
              property :platform, required: true
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
