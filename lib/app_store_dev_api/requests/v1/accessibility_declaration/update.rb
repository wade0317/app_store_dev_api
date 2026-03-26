module AppStoreDevApi
  module Requests
    module V1
      module AccessibilityDeclaration
        class Update < Request::Body
          data do
            id
            type 'accessibilityDeclarations'
            attributes do
              property :publish
              property :supportsAudioDescriptions
              property :supportsCaptions
              property :supportsDarkInterface
              property :supportsDifferentiateWithoutColorAlone
              property :supportsLargerText
              property :supportsReducedMotion
              property :supportsSufficientContrast
              property :supportsVoiceControl
              property :supportsVoiceover
            end
          end
        end
      end
    end
  end
end