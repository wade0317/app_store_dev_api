# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module CustomerReviewResponse
        class Create < Request::Body
          data do
            type 'customerReviewResponses'
            
            attributes do
              property :response_body, required: true
            end
          end
        end
      end
    end
  end
end
