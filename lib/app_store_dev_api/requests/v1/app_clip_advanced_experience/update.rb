# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppClipAdvancedExperience
        class Update < Request::Body
          data do
            type 'appClipAdvancedExperiences'

            attributes do
              property :action
              property :isPoweredBy
              property :place
              property :businessCategory
              property :defaultLanguage
              property :removed
            end


            relationships do
              property :appClip
              property :headerImage
              property :localizations
            end

          end
        end
      end
    end
  end
end
