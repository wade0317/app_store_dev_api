# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppPriceSchedule
        class Create < Request::Body
          data do
            type 'appPriceSchedules'



            relationships do
              property :app, required: true
              property :baseTerritory, required: true
              property :manualPrices, required: true
            end

          end
        end
      end
    end
  end
end
