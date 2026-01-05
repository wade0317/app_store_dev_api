# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterChallengeVersionRelease
        class Create < Request::Body
          data do
            type 'gameCenterChallengeVersionReleases'



            relationships do
              property :gameCenterDetail, required: true
              property :version, required: true
            end

          end
        end
      end
    end
  end
end
