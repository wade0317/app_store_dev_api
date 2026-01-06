# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterAchievementImage
        class Update < Request::Body
          data do
            type 'gameCenterAchievementImages'

            attributes do
              property :uploaded
            end


          end
        end
      end
    end
  end
end
