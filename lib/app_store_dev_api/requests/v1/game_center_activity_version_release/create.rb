# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterActivityVersionRelease
        class Create < Request::Body
          data do
            type 'gameCenterActivityVersionReleases'



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
