# frozen_string_literal: true


module AppStoreDevApi
  module Requests
    module V1
      module Certificate
        class Create < Request::Body
		    data do
		      type 'certificates'

		      attributes do
		        property :certificate_type, required: true
		        property :csr_content, required: true
		      end
		    end
        end
      end
    end
  end
end

