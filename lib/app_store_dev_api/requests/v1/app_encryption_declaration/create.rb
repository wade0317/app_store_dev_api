# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppEncryptionDeclaration
        class Create < Request::Body
          data do
            type 'appEncryptionDeclarations'

            attributes do
              property :usesEncryption, required: true
              property :exempt
              property :containsProprietaryCryptography
              property :containsThirdPartyCryptography
              property :availableOnFrenchStore
              property :platform
              property :uploadedDate
              property :documentName
              property :documentType
              property :documentUrl
              property :appDescription
            end

            relationships do
              property :app, required: true
              property :builds
              property :appEncryptionDeclarationDocument
            end
          end
        end
      end
    end
  end
end