# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module BetaAppReviewDetail
        class Update < Request::Body
          data do
            type 'betaAppReviewDetails'

            attributes do
              property :contactFirstName
              property :contactLastName
              property :contactPhone
              property :contactEmail
              property :demoAccountName
              property :demoAccountPassword
              property :demoAccountRequired
              property :notes
            end


          end
        end
      end
    end
  end
end
