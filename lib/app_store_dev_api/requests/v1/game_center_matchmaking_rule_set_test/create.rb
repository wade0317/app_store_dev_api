# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterMatchmakingRuleSetTest
        class Create < Request::Body
          data do
            type 'gameCenterMatchmakingRuleSetTests'



            relationships do
              property :matchmakingRuleSet, required: true
              property :matchmakingRequests, required: true
            end

          end
        end
      end
    end
  end
end
