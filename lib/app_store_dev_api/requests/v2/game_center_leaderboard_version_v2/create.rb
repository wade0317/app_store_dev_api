# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V2
      module GameCenterLeaderboardVersionV2
        class Create < Request::Body
          data do
            type 'gameCenterLeaderboardVersions'



            relationships do
              property :leaderboard, required: true
            end

          end
        end
      end
    end
  end
end
