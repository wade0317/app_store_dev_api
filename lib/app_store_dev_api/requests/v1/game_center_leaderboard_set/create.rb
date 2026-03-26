# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterLeaderboardSet
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
            end

          end
        end
      end
    end
  end
end
