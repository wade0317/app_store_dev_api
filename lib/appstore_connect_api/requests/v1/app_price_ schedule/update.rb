# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module AppPriceSchedule
        class Update < Request::Body
          data do
            
            type 'appPriceSchedules'

          end
        end
      end
    end
  end
end
