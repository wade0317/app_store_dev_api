# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterPlayerAchievementSubmission
        class Create < Request::Body
          data do
            type 'gameCenterPlayerAchievementSubmissions'

            attributes do
              property :bundleId, required: true
              property :challengeIds
              property :percentageAchieved, required: true
              property :scopedPlayerId, required: true
              property :submittedDate
              property :vendorIdentifier, required: true
            end


          end
        end
      end
    end
  end
end
