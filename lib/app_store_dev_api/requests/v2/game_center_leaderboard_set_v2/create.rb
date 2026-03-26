# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V2
      module GameCenterLeaderboardSetV2
        class Create < Request::Body
          data do
            type 'gameCenterLeaderboardSets'

            attributes do
              property :referenceName, required: true
              property :vendorIdentifier, required: true
            end


            relationships do
              property :gameCenterDetail
              property :gameCenterGroup
              property :gameCenterLeaderboards
              property :versions, required: true
            end

          end
        end
      end
    end
  end
end
