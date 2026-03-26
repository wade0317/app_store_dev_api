# frozen_string_literal: true

module AppStoreDevApi
  module Requests
    module V1
      module WinBackOffer
        class UpdatePricesLinkages < Request::Body
          data do
            array do
              id
              type 'winBackOfferPrices'
            end
          end
        end
      end
    end
  end
end