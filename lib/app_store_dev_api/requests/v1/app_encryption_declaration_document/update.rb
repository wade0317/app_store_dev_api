# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppEncryptionDeclarationDocument
        class Update < Request::Body
          data do
            id
            type 'appEncryptionDeclarationDocuments'

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