# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterMatchmakingQueue
        class Create < Request::Body
          data do
            type 'gameCenterMatchmakingQueues'

            attributes do
              property :referenceName, required: true
              property :classicMatchmakingBundleIds
            end


            relationships do
              property :ruleSet, required: true
              property :experimentRuleSet
            end

          end
        end
      end
    end
  end
end
