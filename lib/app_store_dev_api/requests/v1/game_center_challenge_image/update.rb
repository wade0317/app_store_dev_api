# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterChallengeImage
        class Update < Request::Body
          data do
            type 'gameCenterChallengeImages'

            attributes do
              property :uploaded
            end


          end
        end
      end
    end
  end
end
