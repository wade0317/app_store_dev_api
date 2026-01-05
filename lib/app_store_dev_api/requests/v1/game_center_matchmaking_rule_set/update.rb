# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterMatchmakingRuleSet
        class Update < Request::Body
          data do
            type 'gameCenterMatchmakingRuleSets'

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
