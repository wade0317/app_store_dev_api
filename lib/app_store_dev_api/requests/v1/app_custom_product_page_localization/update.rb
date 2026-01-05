# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppCustomProductPageLocalization
        class Update < Request::Body
          data do
            type 'appCustomProductPageLocalizations'

            attributes do
              property :promotionalText
            end


          end
        end
      end
    end
  end
end
