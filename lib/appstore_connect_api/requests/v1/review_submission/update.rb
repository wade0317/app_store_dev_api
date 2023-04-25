# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module ReviewSubmissionCreateRequest
        class Create < Request::Body
        data do
          id
          type 'reviewSubmissions'

          attributes do
            property :canceled
            property :submitted
          end
        end
        end
      end
    end
  end
end

