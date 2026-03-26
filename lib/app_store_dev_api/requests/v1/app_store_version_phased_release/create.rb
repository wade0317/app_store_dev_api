# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppStoreVersionPhasedRelease
        class Create < Request::Body
          data do
            type 'appStoreVersionPhasedReleases'

            attributes do
              property :phasedReleaseState
            end


            relationships do
              property :appStoreVersion, required: true
            end

          end
        end
      end
    end
  end
end
