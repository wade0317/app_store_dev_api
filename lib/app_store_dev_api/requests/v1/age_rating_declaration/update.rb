# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AgeRatingDeclaration
        class Update < Request::Body
          data do
            id
            type 'ageRatingDeclarations'

            attributes do
              property :alcoholTobaccoOrDrugUseOrReferences
              property :contests
              property :gamblingSimulated
              property :horrorOrFearThemes
              property :matureOrSuggestiveThemes
              property :medicalOrTreatmentInformation
              property :profanityOrCrudeHumor
              property :sexualContentGraphicAndNudity
              property :sexualContentOrNudity
              property :violenceCartoonOrFantasy
              property :violenceRealistic
              property :violenceRealisticProlongedGraphicOrSadistic
              property :gambling
              property :kidsAgeBand
              property :seventeenPlus
              property :unrestrictedWebAccess
            end
          end
        end
      end
    end
  end
end