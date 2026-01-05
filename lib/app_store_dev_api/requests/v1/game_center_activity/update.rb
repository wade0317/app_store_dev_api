# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterActivity
        class Update < Request::Body
          data do
            type 'gameCenterActivities'

            attributes do
              property :referenceName
              property :playStyle
              property :minimumPlayersCount
              property :maximumPlayersCount
              property :supportsPartyCode
              property :archived
              property :properties
            end


          end
        end
      end
    end
  end
end
