# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterChallenge
        class Create < Request::Body
          data do
            type 'gameCenterChallenges'

            attributes do
              property :referenceName, required: true
              property :vendorIdentifier, required: true
              property :challengeType, required: true
              property :repeatable
            end


            relationships do
              property :gameCenterDetail
              property :gameCenterGroup
              property :leaderboard
              property :leaderboardV2
            end

          end
        end
      end
    end
  end
end
