# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterActivityVersion
        class Update < Request::Body
          data do
            type 'gameCenterActivityVersions'

            attributes do
              property :fallbackUrl
            end


          end
        end
      end
    end
  end
end
