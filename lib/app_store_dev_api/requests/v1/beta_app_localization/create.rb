# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module BetaAppLocalization
        class Create < Request::Body
          data do
            type 'betaAppLocalizations'

            attributes do
              property :feedbackEmail
              property :marketingUrl
              property :privacyPolicyUrl
              property :tvOsPrivacyPolicy
              property :description
              property :locale, required: true
            end


            relationships do
              property :app, required: true
            end

          end
        end
      end
    end
  end
end
