module AppStoreDevApi
  module Requests
  module V1
  module AgeRatingDeclaration
    class Update < Request::Body
      data do
        id
        type 'ageRatingDeclarations'
        attributes do
          property :advertising
          property :alcoholTobaccoOrDrugUseOrReferences
          property :contests
          property :gambling
          property :gamblingSimulated
          property :gunsOrOtherWeapons
          property :healthOrWellnessTopics
          property :kidsAgeBand
          property :lootBox
          property :medicalOrTreatmentInformation
          property :messagingAndChat
          property :parentalControls
          property :profanityOrCrudeHumor
          property :ageAssurance
          property :sexualContentGraphicAndNudity
          property :sexualContentOrNudity
          property :horrorOrFearThemes
          property :matureOrSuggestiveThemes
          property :unrestrictedWebAccess
          property :userGeneratedContent
          property :violenceCartoonOrFantasy
          property :violenceRealisticProlongedGraphicOrSadistic
          property :violenceRealistic
          property :ageRatingOverride
          property :ageRatingOverrideV2
          property :koreaAgeRatingOverride
          property :developerAgeRatingInfoUrl
        end
      end
    end
  end
  end
  end
end
