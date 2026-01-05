# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterLeaderboardSetRelease
        class Create < Request::Body
          data do
            type 'gameCenterLeaderboardSetReleases'



            relationships do
              property :gameCenterDetail, required: true
              property :gameCenterLeaderboardSet, required: true
            end

          end
        end
      end
    end
  end
end
