# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module AppStoreVersionPhasedRelease
        class Create < Request::Body
          data do
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
