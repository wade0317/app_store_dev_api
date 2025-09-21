# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module ReviewSubmission
        class Create < Request::Body
          data do
            type 'reviewSubmissions'

            attributes do
              property :platform, required: true
            end

            relationships do
              property :app, required: true
            end
          end
        end
      end
    end
  end
end

