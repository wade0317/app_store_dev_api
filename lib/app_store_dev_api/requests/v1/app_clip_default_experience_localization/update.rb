# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppClipDefaultExperienceLocalization
        class Update < Request::Body
          data do
            type 'appClipDefaultExperienceLocalizations'

            attributes do
              property :subtitle
            end


          end
        end
      end
    end
  end
end
