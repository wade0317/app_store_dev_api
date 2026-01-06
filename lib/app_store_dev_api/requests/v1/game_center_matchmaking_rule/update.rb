# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterMatchmakingRule
        class Update < Request::Body
          data do
            type 'gameCenterMatchmakingRules'

            attributes do
              property :description
              property :expression
              property :weight
            end


          end
        end
      end
    end
  end
end
