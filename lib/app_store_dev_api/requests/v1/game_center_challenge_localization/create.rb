# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterChallengeLocalization
        class Create < Request::Body
          data do
            type 'gameCenterChallengeLocalizations'

            attributes do
              property :locale, required: true
              property :name, required: true
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
