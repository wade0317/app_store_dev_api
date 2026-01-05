# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module BetaAppReviewSubmission
        class Create < Request::Body
          data do
            type 'betaAppReviewSubmissions'



            relationships do
              property :build, required: true
            end

          end
        end
      end
    end
  end
end
