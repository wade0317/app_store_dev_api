# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterChallengeVersion
        class Create < Request::Body
          data do
            type 'gameCenterChallengeVersions'



            relationships do
              property :challenge, required: true
            end

          end
        end
      end
    end
  end
end
