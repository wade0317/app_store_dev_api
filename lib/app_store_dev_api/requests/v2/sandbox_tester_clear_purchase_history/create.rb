# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V2
      module SandboxTesterClearPurchaseHistory
        class Create < Request::Body
          data do
            type 'sandboxTestersClearPurchaseHistoryRequest'

            relationships do
              property :sandbox_testers, required: true
            end
          end
        end
      end
    end
  end
end
