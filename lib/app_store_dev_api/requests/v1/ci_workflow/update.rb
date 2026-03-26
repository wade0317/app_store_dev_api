# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module CiWorkflow
        class Update < Request::Body
          data do
            type 'ciWorkflows'

            attributes do
              property :name
              property :description
              property :branchStartCondition
              property :tagStartCondition
              property :pullRequestStartCondition
              property :scheduledStartCondition
              property :manualBranchStartCondition
              property :manualTagStartCondition
              property :manualPullRequestStartCondition
              property :actions
              property :isEnabled
              property :isLockedForEditing
              property :clean
              property :containerFilePath
            end


            relationships do
              property :xcodeVersion
              property :macOsVersion
            end

          end
        end
      end
    end
  end
end
