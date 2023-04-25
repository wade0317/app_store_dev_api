# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module AppStoreVersion
        class Create < Request::Body
          data do
            type 'appStoreVersions'

            attributes do
              property :copyright
              property :earliest_release_date
              property :platform, required: true
              property :release_type
              property :version_string, required: true
            end
          end
        end
      end
    end
  end
end
