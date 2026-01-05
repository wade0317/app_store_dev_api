# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module BetaTester
        class Create < Request::Body
          data do
            type 'betaTesters'

            attributes do
              property :firstName
              property :lastName
              property :email, required: true
            end


            relationships do
              property :betaGroups
              property :builds
            end

          end
        end
      end
    end
  end
end
