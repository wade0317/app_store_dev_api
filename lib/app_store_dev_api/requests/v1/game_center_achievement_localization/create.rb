# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterAchievementLocalization
        class Create < Request::Body
          data do
            type 'gameCenterAchievementLocalizations'

            attributes do
              property :locale, required: true
              property :name, required: true
              property :beforeEarnedDescription, required: true
              property :afterEarnedDescription, required: true
            end


            relationships do
              property :gameCenterAchievement, required: true
            end

          end
        end
      end
    end
  end
end
