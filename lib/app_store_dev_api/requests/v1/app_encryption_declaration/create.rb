module AppStoreDevApi
  module Requests
  module V1
  module AppEncryptionDeclaration
    class Create < Request::Body
      data do
        type 'appEncryptionDeclarations'
        attributes do
          property :appDescription, required: true
          property :containsProprietaryCryptography, required: true
          property :containsThirdPartyCryptography, required: true
          property :availableOnFrenchStore, required: true
        end
        relationships do
          property :app, required: true
        end
      end
    end
  end
  end
  end
end
