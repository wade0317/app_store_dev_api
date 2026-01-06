# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterLeaderboardSetImage
        class Update < Request::Body
          data do
            type 'gameCenterLeaderboardSetImages'

            attributes do
              property :uploaded
            end


          end
        end
      end
    end
  end
end
