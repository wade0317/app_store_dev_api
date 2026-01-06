# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module GameCenterActivityLocalization
        class Create < Request::Body
          data do
            type 'gameCenterActivityLocalizations'

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
