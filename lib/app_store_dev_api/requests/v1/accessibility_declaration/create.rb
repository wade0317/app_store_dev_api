module AppStoreDevApi
  module Requests
    module V1
      module AccessibilityDeclaration
        class Create < Request::Body
          data do
            type 'accessibilityDeclarations'
            attributes do
              property :deviceFamily, required: true
              property :hasMotion
              property :hasFlashingLights
              property :hasStrobingLights
              property :hasSoundEffects
              property :hasBackgroundAudio
              property :isMadeForKids
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