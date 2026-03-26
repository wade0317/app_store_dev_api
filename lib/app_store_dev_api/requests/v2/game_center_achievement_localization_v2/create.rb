# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V2
      module GameCenterAchievementLocalizationV2
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
              property :version, required: true
            end

          end
        end
      end
    end
  end
end
