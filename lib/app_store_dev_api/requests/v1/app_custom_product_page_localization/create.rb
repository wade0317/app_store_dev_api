# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppCustomProductPageLocalization
        class Create < Request::Body
          data do
            type 'appCustomProductPageLocalizations'

            attributes do
              property :locale, required: true
              property :promotionalText
            end


            relationships do
              property :appCustomProductPageVersion, required: true
            end

          end
        end
      end
    end
  end
end
