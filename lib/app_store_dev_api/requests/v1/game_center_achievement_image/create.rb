# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterAchievementImage
        class Create < Request::Body
          data do
            type 'gameCenterAchievementImages'

            attributes do
              property :fileSize, required: true
              property :fileName, required: true
            end


            relationships do
              property :gameCenterAchievementLocalization, required: true
            end

          end
        end
      end
    end
  end
end
