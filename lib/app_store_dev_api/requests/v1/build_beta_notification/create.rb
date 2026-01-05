# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module BuildBetaNotification
        class Create < Request::Body
          data do
            type 'buildBetaNotifications'



            relationships do
              property :build, required: true
            end

          end
        end
      end
    end
  end
end
