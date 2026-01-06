# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppClipHeaderImage
        class Update < Request::Body
          data do
            type 'appClipHeaderImages'

            attributes do
              property :sourceFileChecksum
              property :uploaded
            end


          end
        end
      end
    end
  end
end
