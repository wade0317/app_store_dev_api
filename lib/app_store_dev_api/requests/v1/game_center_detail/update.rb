# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterDetail
        class Update < Request::Body
          data do
            type 'gameCenterDetails'

            attributes do
              property :challengeEnabled
            end


            relationships do
              property :gameCenterGroup
              property :defaultLeaderboard
              property :defaultLeaderboardV2
              property :defaultGroupLeaderboard
              property :defaultGroupLeaderboardV2
            end

          end
        end
      end
    end
  end
end
