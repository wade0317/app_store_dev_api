# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module ReviewSubmissionItem
        class Create < Request::Body
          data do
            type 'reviewSubmissionItems'

            relationships do
              property :app_custom_product_page_version
              property :app_event
              property :app_store_version
              property :app_store_version_experiment
              property :app_store_version_experiment_v2
            end
          end
        end
      end
    end
  end
end
