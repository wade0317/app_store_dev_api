# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterMatchmakingQueue
        class Update < Request::Body
          data do
            type 'gameCenterMatchmakingQueues'

            attributes do
              property :classicMatchmakingBundleIds
            end


            relationships do
              property :ruleSet
              property :experimentRuleSet
            end

          end
        end
      end
    end
  end
end
