# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppCustomProductPage
        class Update < Request::Body
          data do
            type 'appCustomProductPages'

            attributes do
              property :name
              property :visible
            end


          end
        end
      end
    end
  end
end
