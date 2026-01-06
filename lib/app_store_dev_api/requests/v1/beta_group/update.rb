# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module BetaGroup
        class Update < Request::Body
          data do
            type 'betaGroups'

            attributes do
              property :name
              property :publicLinkEnabled
              property :publicLinkLimitEnabled
              property :publicLinkLimit
              property :feedbackEnabled
              property :iosBuildsAvailableForAppleSiliconMac
              property :iosBuildsAvailableForAppleVision
            end


          end
        end
      end
    end
  end
end
