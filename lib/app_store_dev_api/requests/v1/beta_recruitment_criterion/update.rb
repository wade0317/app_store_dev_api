# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module BetaRecruitmentCriterion
        class Update < Request::Body
          data do
            type 'betaRecruitmentCriteria'

            attributes do
              property :deviceFamilyOsVersionFilters
            end


          end
        end
      end
    end
  end
end
