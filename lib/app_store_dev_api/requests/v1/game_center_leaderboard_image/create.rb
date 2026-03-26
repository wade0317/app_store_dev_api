# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterLeaderboardImage
        class Create < Request::Body
          data do
            type 'gameCenterLeaderboardImages'

            attributes do
              property :fileSize, required: true
              property :fileName, required: true
            end


            relationships do
              property :gameCenterLeaderboardLocalization, required: true
            end

          end
        end
      end
    end
  end
end
