module AppStoreDevApi
  module Requests
    module V1
      module AccessibilityDeclaration
        class Update < Request::Body
          data do
            id
            type 'accessibilityDeclarations'
            attributes do
              property :deviceFamily
              property :hasMotion
              property :hasFlashingLights
              property :hasStrobingLights
              property :hasSoundEffects
              property :hasBackgroundAudio
              property :isMadeForKids
            end
          end
        end
      end
    end
  end
end