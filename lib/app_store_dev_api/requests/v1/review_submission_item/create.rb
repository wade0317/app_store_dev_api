module AppStoreDevApi
  module Requests
  module V1
  module ReviewSubmissionItem
    class Create < Request::Body
      data do
        type 'reviewSubmissionItems'
        relationships do
          property :reviewSubmission, required: true
          property :appStoreVersion
          property :appCustomProductPageVersion
          property :appStoreVersionExperiment
          property :appStoreVersionExperimentV2
          property :appEvent
          property :backgroundAssetVersion
          property :gameCenterAchievementVersion
          property :gameCenterActivityVersion
          property :gameCenterChallengeVersion
          property :gameCenterLeaderboardSetVersion
          property :gameCenterLeaderboardVersion
        end
      end
    end
  end
  end
  end
end
