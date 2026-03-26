# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module BetaAppClipInvocation
        class Update < Request::Body
          data do
            type 'betaAppClipInvocations'

            attributes do
              property :url
            end


          end
        end
      end
    end
  end
end
