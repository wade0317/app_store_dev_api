# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppScreenshot
        class Update < Request::Body
          data do
            id
            type 'appScreenshots'

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