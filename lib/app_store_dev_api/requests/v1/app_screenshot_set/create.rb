# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppScreenshotSet
        class Create < Request::Body
          data do
            type 'appScreenshotSets'

            attributes do
              property :screenshotDisplayType, required: true
            end

            relationships do
              property :appStoreVersionLocalization
              property :appCustomProductPageLocalization
              property :appStoreVersionExperimentTreatmentLocalization
            end
          end
        end
      end
    end
  end
end