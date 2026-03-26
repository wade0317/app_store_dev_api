# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module BuildUploadFile
        class Update < Request::Body
          data do
            type 'buildUploadFiles'

            attributes do
              property :sourceFileChecksums
              property :uploaded
            end


          end
        end
      end
    end
  end
end
