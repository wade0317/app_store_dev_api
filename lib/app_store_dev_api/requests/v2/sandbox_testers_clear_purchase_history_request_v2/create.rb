# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V2
      module SandboxTestersClearPurchaseHistoryRequestV2
        class Create < Request::Body
          data do
            type 'sandboxTestersClearPurchaseHistoryRequest'



            relationships do
              property :sandboxTesters, required: true
            end

          end
        end
      end
    end
  end
end
