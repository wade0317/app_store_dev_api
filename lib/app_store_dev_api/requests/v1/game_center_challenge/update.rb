# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterChallenge
        class Update < Request::Body
          data do
            type 'gameCenterChallenges'

            attributes do
              property :referenceName
              property :archived
              property :repeatable
            end


            relationships do
              property :leaderboard
              property :leaderboardV2
            end

          end
        end
      end
    end
  end
end
