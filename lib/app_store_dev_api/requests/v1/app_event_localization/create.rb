# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppEventLocalization
        class Create < Request::Body
          data do
            type 'appEventLocalizations'

            attributes do
              property :locale, required: true
              property :name
              property :shortDescription
              property :longDescription
            end


            relationships do
              property :appEvent, required: true
            end

          end
        end
      end
    end
  end
end
