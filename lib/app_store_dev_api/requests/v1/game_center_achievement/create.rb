# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterAchievement
        class Create < Request::Body
          data do
            type 'gameCenterAchievements'

            attributes do
              property :referenceName, required: true
              property :vendorIdentifier, required: true
              property :points, required: true
              property :showBeforeEarned, required: true
              property :repeatable, required: true
              property :activityProperties
            end


            relationships do
              property :gameCenterDetail
              property :gameCenterGroup
            end

          end
        end
      end
    end
  end
end
