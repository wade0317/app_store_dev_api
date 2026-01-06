# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module BetaTesterInvitation
        class Create < Request::Body
          data do
            type 'betaTesterInvitations'



            relationships do
              property :betaTester
              property :app, required: true
            end

          end
        end
      end
    end
  end
end
