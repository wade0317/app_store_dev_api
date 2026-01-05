# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterLeaderboardSetMemberLocalization
        class Update < Request::Body
          data do
            type 'gameCenterLeaderboardSetMemberLocalizations'

            attributes do
              property :name
            end


          end
        end
      end
    end
  end
end
