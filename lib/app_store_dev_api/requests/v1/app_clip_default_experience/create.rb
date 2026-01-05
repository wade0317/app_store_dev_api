# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppClipDefaultExperience
        class Create < Request::Body
          data do
            type 'appClipDefaultExperiences'

            attributes do
              property :action
            end


            relationships do
              property :appClip, required: true
              property :releaseWithAppStoreVersion
              property :appClipDefaultExperienceTemplate
            end

          end
        end
      end
    end
  end
end
