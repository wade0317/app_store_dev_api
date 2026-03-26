# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterLeaderboardLocalization
        class Create < Request::Body
          data do
            type 'gameCenterLeaderboardLocalizations'

            attributes do
              property :locale, required: true
              property :name, required: true
              property :formatterOverride
              property :formatterSuffix
              property :formatterSuffixSingular
              property :description
            end


            relationships do
              property :gameCenterLeaderboard, required: true
            end

          end
        end
      end
    end
  end
end
