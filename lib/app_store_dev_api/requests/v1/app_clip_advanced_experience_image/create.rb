# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppClipAdvancedExperienceImage
        class Create < Request::Body
          data do
            type 'appClipAdvancedExperienceImages'

            attributes do
              property :fileSize, required: true
              property :fileName, required: true
            end


          end
        end
      end
    end
  end
end
