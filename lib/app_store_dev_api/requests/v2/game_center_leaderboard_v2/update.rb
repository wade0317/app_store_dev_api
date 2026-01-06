# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V2
      module GameCenterLeaderboardV2
        class Update < Request::Body
          data do
            type 'gameCenterLeaderboards'

            attributes do
              property :defaultFormatter
              property :referenceName
              property :submissionType
              property :scoreSortType
              property :scoreRangeStart
              property :scoreRangeEnd
              property :recurrenceStartDate
              property :recurrenceDuration
              property :recurrenceRule
              property :archived
              property :activityProperties
              property :visibility
            end


          end
        end
      end
    end
  end
end
