# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterMatchmakingTeam
        class Update < Request::Body
          data do
            type 'gameCenterMatchmakingTeams'

            attributes do
              property :minPlayers
              property :maxPlayers
            end


          end
        end
      end
    end
  end
end
