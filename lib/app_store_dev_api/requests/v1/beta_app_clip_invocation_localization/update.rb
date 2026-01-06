# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module BetaAppClipInvocationLocalization
        class Update < Request::Body
          data do
            type 'betaAppClipInvocationLocalizations'

            attributes do
              property :title
            end


          end
        end
      end
    end
  end
end
