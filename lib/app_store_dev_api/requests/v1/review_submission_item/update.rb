# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module ReviewSubmissionItem
        class Update < Request::Body
          data do
            id
            type 'reviewSubmissionItems'

            attributes do
              property :resolved
            end
          end
        end
      end
    end
  end
end