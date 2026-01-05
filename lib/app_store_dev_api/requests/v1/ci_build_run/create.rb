# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module CiBuildRun
        class Create < Request::Body
          data do
            type 'ciBuildRuns'

            attributes do
              property :clean
            end


            relationships do
              property :buildRun
              property :workflow
              property :sourceBranchOrTag
              property :pullRequest
            end

          end
        end
      end
    end
  end
end
