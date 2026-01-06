# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterLeaderboardSetImage
        class Create < Request::Body
          data do
            type 'gameCenterLeaderboardSetImages'

            attributes do
              property :fileSize, required: true
              property :fileName, required: true
            end


            relationships do
              property :gameCenterLeaderboardSetLocalization, required: true
            end

          end
        end
      end
    end
  end
end
