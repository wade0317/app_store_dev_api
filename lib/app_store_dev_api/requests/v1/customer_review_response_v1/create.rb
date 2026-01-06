# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module CustomerReviewResponseV1
        class Create < Request::Body
          data do
            type 'customerReviewResponses'

            attributes do
              property :responseBody, required: true
            end


            relationships do
              property :review, required: true
            end

          end
        end
      end
    end
  end
end
