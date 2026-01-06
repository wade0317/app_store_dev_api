# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppClipAdvancedExperienceImage
        class Update < Request::Body
          data do
            type 'appClipAdvancedExperienceImages'

            attributes do
              property :sourceFileChecksum
              property :uploaded
            end


          end
        end
      end
    end
  end
end
