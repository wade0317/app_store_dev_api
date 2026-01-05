# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterActivityLocalization
        class Update < Request::Body
          data do
            type 'gameCenterActivityLocalizations'

            attributes do
              property :name
              property :description
            end


          end
        end
      end
    end
  end
end
