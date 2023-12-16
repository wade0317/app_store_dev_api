# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppStoreVersionPhasedRelease
        class Update < Request::Body
          data do
            id
            type 'appStoreVersionPhasedReleases'

            attributes do
              property :phased_release_state
            end
          end
        end
      end
    end
  end
end
