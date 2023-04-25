# frozen_string_literal: true

module AppStoreConnectApi
  module Requests
    module V1
      module AppStoreVersionBuildLinkageRequest
        class Update < Request::Body
            data do
              id :build_id
              type 'builds'
            end
          end
        end
      end
    end
  end
end
