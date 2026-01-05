# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppCustomProductPageVersion
        class Update < Request::Body
          data do
            type 'appCustomProductPageVersions'

            attributes do
              property :deepLink
            end


          end
        end
      end
    end
  end
end
