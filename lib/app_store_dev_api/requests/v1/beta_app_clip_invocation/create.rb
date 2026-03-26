# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module BetaAppClipInvocation
        class Create < Request::Body
          data do
            type 'betaAppClipInvocations'

            attributes do
              property :url, required: true
            end


            relationships do
              property :buildBundle, required: true
              property :betaAppClipInvocationLocalizations, required: true
            end

          end
        end
      end
    end
  end
end
