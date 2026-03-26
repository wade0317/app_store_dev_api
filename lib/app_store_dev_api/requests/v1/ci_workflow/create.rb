# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module CiWorkflow
        class Create < Request::Body
          data do
            type 'ciWorkflows'

            attributes do
              property :name, required: true
              property :description, required: true
              property :branchStartCondition
              property :tagStartCondition
              property :pullRequestStartCondition
              property :scheduledStartCondition
              property :manualBranchStartCondition
              property :manualTagStartCondition
              property :manualPullRequestStartCondition
              property :actions, required: true
              property :isEnabled, required: true
              property :isLockedForEditing
              property :clean, required: true
              property :containerFilePath, required: true
            end


            relationships do
              property :product, required: true
              property :repository, required: true
              property :xcodeVersion, required: true
              property :macOsVersion, required: true
            end

          end
        end
      end
    end
  end
end
