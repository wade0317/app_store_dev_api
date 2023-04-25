# frozen_string_literal: true

module AppStoreConnectApi
  class BetaBuildLocalizationModifyRequest < Request::Body
    data do
      type 'betaBuildLocalizations'

      attributes do
        property :whats_new
      end
    end
  end
end
