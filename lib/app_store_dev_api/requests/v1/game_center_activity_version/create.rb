# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterActivityVersion
        class Create < Request::Body
          data do
            type 'gameCenterActivityVersions'

            attributes do
              property :fallbackUrl
            end


            relationships do
              property :activity, required: true
            end

          end
        end
      end
    end
  end
end
