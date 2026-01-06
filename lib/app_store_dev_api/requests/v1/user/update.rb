# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module User
        class Update < Request::Body
          data do
            type 'users'

            attributes do
              property :roles
              property :allAppsVisible
              property :provisioningAllowed
            end


            relationships do
              property :visibleApps
            end

          end
        end
      end
    end
  end
end
