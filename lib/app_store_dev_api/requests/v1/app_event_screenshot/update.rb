# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppEventScreenshot
        class Update < Request::Body
          data do
            type 'appEventScreenshots'

            attributes do
              property :uploaded
            end


          end
        end
      end
    end
  end
end
