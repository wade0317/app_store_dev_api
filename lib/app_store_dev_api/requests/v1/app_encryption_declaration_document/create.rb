# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppEncryptionDeclarationDocument
        class Create < Request::Body
          data do
            type 'appEncryptionDeclarationDocuments'

            attributes do
              property :fileSize, required: true
              property :fileName, required: true
            end

            relationships do
              property :appEncryptionDeclaration, required: true
            end
          end
        end
      end
    end
  end
end