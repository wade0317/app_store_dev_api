# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterMatchmakingTeam
        class Create < Request::Body
          data do
            type 'gameCenterMatchmakingTeams'

            attributes do
              property :referenceName, required: true
              property :minPlayers, required: true
              property :maxPlayers, required: true
            end


            relationships do
              property :ruleSet, required: true
            end

          end
        end
      end
    end
  end
end
