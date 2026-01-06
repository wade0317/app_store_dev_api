# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterActivity
        class Create < Request::Body
          data do
            type 'gameCenterActivities'

            attributes do
              property :referenceName, required: true
              property :vendorIdentifier, required: true
              property :playStyle
              property :minimumPlayersCount
              property :maximumPlayersCount
              property :supportsPartyCode
              property :properties
            end


            relationships do
              property :gameCenterDetail
              property :gameCenterGroup
            end

          end
        end
      end
    end
  end
end
