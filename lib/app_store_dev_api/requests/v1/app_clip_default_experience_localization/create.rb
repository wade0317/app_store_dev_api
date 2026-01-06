# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppClipDefaultExperienceLocalization
        class Create < Request::Body
          data do
            type 'appClipDefaultExperienceLocalizations'

            attributes do
              property :locale, required: true
              property :subtitle
            end


            relationships do
              property :appClipDefaultExperience, required: true
            end

          end
        end
      end
    end
  end
end
