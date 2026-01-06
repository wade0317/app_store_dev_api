# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppClipAdvancedExperience
        class Create < Request::Body
          data do
            type 'appClipAdvancedExperiences'

            attributes do
              property :link, required: true
              property :action
              property :isPoweredBy, required: true
              property :place
              property :businessCategory
              property :defaultLanguage, required: true
            end


            relationships do
              property :appClip, required: true
              property :headerImage, required: true
              property :localizations, required: true
            end

          end
        end
      end
    end
  end
end
