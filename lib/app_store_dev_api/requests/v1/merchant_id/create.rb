# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module MerchantId
        class Create < Request::Body
          data do
            type 'merchantIds'

            attributes do
              property :name, required: true
              property :identifier, required: true
            end


          end
        end
      end
    end
  end
end
