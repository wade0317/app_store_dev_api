# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V2
      module GameCenterAchievementVersionV2
        class Create < Request::Body
          data do
            type 'gameCenterAchievementVersions'



            relationships do
              property :achievement, required: true
            end

          end
        end
      end
    end
  end
end
