# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module BuildBetaGroups
        class Create < Request::Body
          data(Array) do
            id
            type 'betaGroups'
          end
        end
      end
    end
  end
end
