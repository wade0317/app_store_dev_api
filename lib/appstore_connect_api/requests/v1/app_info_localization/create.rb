# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module AppInfoLocalizations
        class Create < Request::Body
          data do
            id
            type 'appInfoLocalizations'

            attributes do
              property :name
              property :subtitle
              property :privacy_policy_text
              property :privacy_policy_url
              property :privacy_choices_url
            end
          end
        end
      end
    end
  end
end
