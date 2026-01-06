# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppStoreVersionReleaseRequest
        class Create < Request::Body
          data do
            type 'appStoreVersionReleaseRequests'



            relationships do
              property :appStoreVersion, required: true
            end

          end
        end
      end
    end
  end
end
