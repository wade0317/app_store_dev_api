# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V2
      module GameCenterAchievementV2
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
              property :versions, required: true
            end

          end
        end
      end
    end
  end
end
