# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module MerchantId
        class Update < Request::Body
          data do
            type 'merchantIds'

            attributes do
              property :name
            end


          end
        end
      end
    end
  end
end
