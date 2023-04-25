# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module BuildUpdateRequest
        class Update < Request::Body
          data do
            id
            type 'builds'

            attributes do
              property :expired
              property :uses_non_exempt_encryption
            end
          end
        end
      end
    end
  end
end
