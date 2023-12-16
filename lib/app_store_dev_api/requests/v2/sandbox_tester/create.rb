# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V2
      module SandboxTester
        class Create < Request::Body
          data do
            type 'sandboxTesters'

            attributes do
              property :first_name
              property :last_name
              property :ac_account_name
              property :ac_account_password
              property :store_front
            end
          end
        end
      end
    end
  end
end
