# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterLeaderboardEntrySubmission
        class Create < Request::Body
          data do
            type 'gameCenterLeaderboardEntrySubmissions'

            attributes do
              property :bundleId, required: true
              property :challengeIds
              property :context
              property :scopedPlayerId, required: true
              property :score, required: true
              property :submittedDate
              property :vendorIdentifier, required: true
            end


          end
        end
      end
    end
  end
end
