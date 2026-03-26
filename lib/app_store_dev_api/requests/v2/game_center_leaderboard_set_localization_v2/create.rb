# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V2
      module GameCenterLeaderboardSetLocalizationV2
        class Create < Request::Body
          data do
            type 'gameCenterLeaderboardSetLocalizations'

            attributes do
              property :locale, required: true
              property :name, required: true
            end


            relationships do
              property :version, required: true
            end

          end
        end
      end
    end
  end
end
