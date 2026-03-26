# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterDetail
        class Create < Request::Body
          data do
            type 'gameCenterDetails'

            attributes do
              property :challengeEnabled
            end


            relationships do
              property :app, required: true
            end

          end
        end
      end
    end
  end
end
