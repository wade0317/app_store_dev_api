# frozen_string_literal: true


module AppStoreDevApi
  module Requests
    module V1
      module Device
        class Create < Request::Body
            data do
              type 'devices'

              attributes do
                property :name, required: true
                property :platform, required: true
                property :udid, required: true
              end
            end
        end
      end
    end
  end
end

