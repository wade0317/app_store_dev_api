# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterLeaderboardRelease
        class Create < Request::Body
          data do
            type 'gameCenterLeaderboardReleases'



            relationships do
              property :gameCenterDetail, required: true
              property :gameCenterLeaderboard, required: true
            end

          end
        end
      end
    end
  end
end
