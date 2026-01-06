# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module BundleId
        class Update < Request::Body
          data do
            id
            type 'bundleIds'

            attributes do
              property :name
            end
          end
        end
      end
    end
  end
end