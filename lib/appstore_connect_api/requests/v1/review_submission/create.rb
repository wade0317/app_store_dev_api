# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module ReviewSubmissionCreateRequest
        class Create < Request::Body
		    data do
		      type 'reviewSubmissions'

		      attributes do
		        property :platform, required: true
		      end
		    end
        end
      end
    end
  end
end

