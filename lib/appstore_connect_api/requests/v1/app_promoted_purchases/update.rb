# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module AppPromotedPurchases
        class Update < Request::Body
          data do
            id 
            type 'promotedPurchases'
          end
        end
      end
    end
  end
end
