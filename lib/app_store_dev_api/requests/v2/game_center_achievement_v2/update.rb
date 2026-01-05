# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V2
      module GameCenterAchievementV2
        class Update < Request::Body
          data do
            type 'gameCenterAchievements'

            attributes do
              property :referenceName
              property :points
              property :showBeforeEarned
              property :repeatable
              property :archived
              property :activityProperties
            end


          end
        end
      end
    end
  end
end
