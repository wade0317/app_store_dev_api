# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module BetaAppLocalization
        class Update < Request::Body
          data do
            type 'betaAppLocalizations'

            attributes do
              property :feedbackEmail
              property :marketingUrl
              property :privacyPolicyUrl
              property :tvOsPrivacyPolicy
              property :description
            end


          end
        end
      end
    end
  end
end
