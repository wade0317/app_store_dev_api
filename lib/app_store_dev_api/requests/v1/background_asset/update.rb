# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module BackgroundAsset
        class Update < Request::Body
          data do
            type 'backgroundAssets'

            attributes do
              property :archived
            end


          end
        end
      end
    end
  end
end
