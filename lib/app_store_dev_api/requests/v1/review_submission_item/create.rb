# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module ReviewSubmissionItemCreateRequest
        class Create < Request::Body
        data do
          type 'reviewSubmissionItems'
        end
        end
      end
    end
  end
end
