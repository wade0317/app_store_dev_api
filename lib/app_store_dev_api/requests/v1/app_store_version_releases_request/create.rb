# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppStoreVersionReleaseRequest
        class Create < Request::Body
          data do
            type 'appStoreVersionReleaseRequests'

            attributes do
              property :phased_release_state
            end
            
          end
        end
      end
    end
  end
end
