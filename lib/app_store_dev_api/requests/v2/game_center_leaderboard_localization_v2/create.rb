# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V2
      module GameCenterLeaderboardLocalizationV2
        class Create < Request::Body
          data do
            type 'gameCenterLeaderboardLocalizations'

            attributes do
              property :locale, required: true
              property :name, required: true
              property :formatterOverride
              property :formatterSuffix
              property :formatterSuffixSingular
              property :description
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
