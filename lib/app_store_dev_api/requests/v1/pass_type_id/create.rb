# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module PassTypeId
        class Create < Request::Body
          data do
            type 'passTypeIds'

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
