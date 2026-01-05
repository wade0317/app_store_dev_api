# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterMatchmakingRule
        class Create < Request::Body
          data do
            type 'gameCenterMatchmakingRules'

            attributes do
              property :referenceName, required: true
              property :description, required: true
              property :type, required: true
              property :expression, required: true
              property :weight
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
