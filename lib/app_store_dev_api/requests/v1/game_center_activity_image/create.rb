# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterActivityImage
        class Create < Request::Body
          data do
            type 'gameCenterActivityImages'

            attributes do
              property :fileSize, required: true
              property :fileName, required: true
            end


            relationships do
              property :localization
              property :version
            end

          end
        end
      end
    end
  end
end
