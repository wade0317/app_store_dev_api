# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppScreenshotSet
        class ReplaceAppScreenshotsLinkage < Request::Body
          data do
            type 'appScreenshots'

            relationships do
              property :appScreenshots, required: true
            end
          end
        end
      end
    end
  end
end