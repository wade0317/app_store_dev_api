# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterLeaderboard
        class Create < Request::Body
          data do
            type 'gameCenterLeaderboards'

            attributes do
              property :defaultFormatter, required: true
              property :referenceName, required: true
              property :vendorIdentifier, required: true
              property :submissionType, required: true
              property :scoreSortType, required: true
              property :scoreRangeStart
              property :scoreRangeEnd
              property :recurrenceStartDate
              property :recurrenceDuration
              property :recurrenceRule
              property :activityProperties
              property :visibility
            end


            relationships do
              property :gameCenterDetail
              property :gameCenterGroup
              property :gameCenterLeaderboardSets
            end

          end
        end
      end
    end
  end
end
