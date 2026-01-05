# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module BetaAppClipInvocationLocalization
        class Create < Request::Body
          data do
            type 'betaAppClipInvocationLocalizations'

            attributes do
              property :title, required: true
              property :locale, required: true
            end


            relationships do
              property :betaAppClipInvocation, required: true
            end

          end
        end
      end
    end
  end
end
