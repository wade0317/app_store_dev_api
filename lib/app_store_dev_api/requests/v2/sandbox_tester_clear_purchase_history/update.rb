# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V2
      module SandboxTestersClearPurchaseHistory
        class Update < Request::Body
          data do
            
            type 'sandboxTestersClearPurchaseHistoryRequest'
          end
        end
      end
    end
  end
end
