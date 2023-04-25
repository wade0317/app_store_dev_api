# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module AppStoreReviewDetail
        class Create < Request::Body
          data do
            type 'appStoreReviewDetails'

            attributes do
              property :contact_email
              property :contact_phone
              property :contact_first_name
              property :contact_last_name
              property :demo_account_name
              property :demo_account_password
              property :demo_account_required
              property :notes
            end
            
          end
        end
      end
    end
  end
end
