# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterLeaderboardSetMemberLocalization
        class Create < Request::Body
          data do
            type 'gameCenterLeaderboardSetMemberLocalizations'

            attributes do
              property :name
              property :locale
            end


            relationships do
              property :gameCenterLeaderboardSet, required: true
              property :gameCenterLeaderboard, required: true
            end

          end
        end
      end
    end
  end
end
