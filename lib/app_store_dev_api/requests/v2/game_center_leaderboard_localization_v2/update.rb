# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V2
      module GameCenterLeaderboardLocalizationV2
        class Update < Request::Body
          data do
            type 'gameCenterLeaderboardLocalizations'

            attributes do
              property :name
              property :formatterOverride
              property :formatterSuffix
              property :formatterSuffixSingular
              property :description
            end


          end
        end
      end
    end
  end
end
