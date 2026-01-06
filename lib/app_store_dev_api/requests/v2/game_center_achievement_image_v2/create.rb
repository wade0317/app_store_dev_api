# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V2
      module GameCenterAchievementImageV2
        class Create < Request::Body
          data do
            type 'gameCenterAchievementImages'

            attributes do
              property :fileSize, required: true
              property :fileName, required: true
            end


            relationships do
              property :localization, required: true
            end

          end
        end
      end
    end
  end
end
