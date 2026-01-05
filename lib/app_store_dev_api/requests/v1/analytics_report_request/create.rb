# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AnalyticsReportRequest
        class Create < Request::Body
          data do
            type 'analyticsReportRequests'

            attributes do
              property :accessType, required: true
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
