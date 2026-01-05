# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterAppVersion
        class Create < Request::Body
          data do
            type 'gameCenterAppVersions'



            relationships do
              property :appStoreVersion, required: true
            end

          end
        end
      end
    end
  end
end
