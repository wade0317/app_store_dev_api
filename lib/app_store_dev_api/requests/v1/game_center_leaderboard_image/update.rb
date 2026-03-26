# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterLeaderboardImage
        class Update < Request::Body
          data do
            type 'gameCenterLeaderboardImages'

            attributes do
              property :uploaded
            end


          end
        end
      end
    end
  end
end
