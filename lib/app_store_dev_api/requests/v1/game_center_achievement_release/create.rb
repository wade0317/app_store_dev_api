# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterAchievementRelease
        class Create < Request::Body
          data do
            type 'gameCenterAchievementReleases'



            relationships do
              property :gameCenterDetail, required: true
              property :gameCenterAchievement, required: true
            end

          end
        end
      end
    end
  end
end
