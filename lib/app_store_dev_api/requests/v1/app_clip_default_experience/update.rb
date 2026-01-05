# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppClipDefaultExperience
        class Update < Request::Body
          data do
            type 'appClipDefaultExperiences'

            attributes do
              property :action
            end


            relationships do
              property :releaseWithAppStoreVersion
            end

          end
        end
      end
    end
  end
end
