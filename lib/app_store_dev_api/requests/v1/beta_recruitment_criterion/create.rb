# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module BetaRecruitmentCriterion
        class Create < Request::Body
          data do
            type 'betaRecruitmentCriteria'

            attributes do
              property :deviceFamilyOsVersionFilters, required: true
            end


            relationships do
              property :betaGroup, required: true
            end

          end
        end
      end
    end
  end
end
