# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterLeaderboardSetLocalization
        class Create < Request::Body
          data do
            type 'gameCenterLeaderboardSetLocalizations'

            attributes do
              property :locale, required: true
              property :name, required: true
            end


            relationships do
              property :gameCenterLeaderboardSet, required: true
            end

          end
        end
      end
    end
  end
end
