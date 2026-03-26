# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module AppStoreVersionExperimentTreatmentLocalization
        class Create < Request::Body
          data do
            type 'appStoreVersionExperimentTreatmentLocalizations'

            attributes do
              property :locale, required: true
            end


            relationships do
              property :appStoreVersionExperimentTreatment, required: true
            end

          end
        end
      end
    end
  end
end
