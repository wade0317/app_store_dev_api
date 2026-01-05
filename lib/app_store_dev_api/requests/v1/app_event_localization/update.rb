# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppEventLocalization
        class Update < Request::Body
          data do
            type 'appEventLocalizations'

            attributes do
              property :name
              property :shortDescription
              property :longDescription
            end


          end
        end
      end
    end
  end
end
