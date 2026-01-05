# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterActivityImage
        class Update < Request::Body
          data do
            type 'gameCenterActivityImages'

            attributes do
              property :uploaded
            end


          end
        end
      end
    end
  end
end
