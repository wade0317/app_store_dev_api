# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppClipHeaderImage
        class Create < Request::Body
          data do
            type 'appClipHeaderImages'

            attributes do
              property :fileSize, required: true
              property :fileName, required: true
            end


            relationships do
              property :appClipDefaultExperienceLocalization, required: true
            end

          end
        end
      end
    end
  end
end
