module AppStoreDevApi
  module Requests
    module V1
      module AccessibilityDeclaration
        class Create < Request::Body
          data do
            type 'accessibilityDeclarations'
            attributes do
              property :deviceFamily, required: true
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
            relationships do
              property :app, required: true
            end
          end
        end
      end
    end
  end
end