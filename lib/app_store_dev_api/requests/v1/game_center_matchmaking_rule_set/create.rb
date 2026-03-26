# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterMatchmakingRuleSet
        class Create < Request::Body
          data do
            type 'gameCenterMatchmakingRuleSets'

            attributes do
              property :referenceName, required: true
              property :ruleLanguageVersion, required: true
              property :minPlayers, required: true
              property :maxPlayers, required: true
            end


          end
        end
      end
    end
  end
end
