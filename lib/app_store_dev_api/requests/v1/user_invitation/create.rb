# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module UserInvitation
        class Create < Request::Body
          data do
            type 'userInvitations'

            attributes do
              property :email, required: true
              property :firstName, required: true
              property :lastName, required: true
              property :roles, required: true
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
