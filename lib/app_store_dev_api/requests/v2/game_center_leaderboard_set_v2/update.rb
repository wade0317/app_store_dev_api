# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V2
      module GameCenterLeaderboardSetV2
        class Update < Request::Body
          data do
            type 'gameCenterLeaderboardSets'

            attributes do
              property :referenceName
            end


          end
        end
      end
    end
  end
end
