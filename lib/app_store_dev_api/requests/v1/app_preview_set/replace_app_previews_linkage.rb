# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppPreviewSet
        class ReplaceAppPreviewsLinkage < Request::Body
          data do
            type 'appPreviews'

            relationships do
              property :appPreviews, required: true
            end
          end
        end
      end
    end
  end
end