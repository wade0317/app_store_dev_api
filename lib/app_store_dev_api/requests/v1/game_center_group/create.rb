# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterGroup
        class Create < Request::Body
          data do
            type 'gameCenterGroups'

            attributes do
              property :referenceName
            end


          end
        end
      end
    end
  end
end
