# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module BetaGroup
        class Create < Request::Body
          data do
            type 'betaGroups'

            attributes do
              property :name, required: true
              property :isInternalGroup
              property :hasAccessToAllBuilds
              property :publicLinkEnabled
              property :publicLinkLimitEnabled
              property :publicLinkLimit
              property :feedbackEnabled
            end


            relationships do
              property :app, required: true
              property :builds
              property :betaTesters
            end

          end
        end
      end
    end
  end
end
