# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V2
      module GameCenterLeaderboardSetVersionV2
        class Create < Request::Body
          data do
            type 'gameCenterLeaderboardSetVersions'



            relationships do
              property :leaderboardSet, required: true
            end

          end
        end
      end
    end
  end
end
