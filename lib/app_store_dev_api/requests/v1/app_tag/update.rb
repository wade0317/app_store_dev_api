# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppTag
        class Update < Request::Body
          data do
            type 'appTags'

            attributes do
              property :visibleInAppStore
            end


          end
        end
      end
    end
  end
end
