# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterAchievementLocalization
        class Update < Request::Body
          data do
            type 'gameCenterAchievementLocalizations'

            attributes do
              property :name
              property :beforeEarnedDescription
              property :afterEarnedDescription
            end


          end
        end
      end
    end
  end
end
