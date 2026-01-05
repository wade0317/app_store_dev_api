# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterChallengeLocalization
        class Update < Request::Body
          data do
            type 'gameCenterChallengeLocalizations'

            attributes do
              property :name
              property :description
            end


          end
        end
      end
    end
  end
end
