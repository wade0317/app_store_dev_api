# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterAppVersion
        class Update < Request::Body
          data do
            type 'gameCenterAppVersions'

            attributes do
              property :enabled
            end


          end
        end
      end
    end
  end
end
