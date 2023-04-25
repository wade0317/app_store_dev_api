# frozen_string_literal: true

module AppStoreConnectApi
  class BetaBuildLocalizationCreateRequest < Request::Body
    data do
      type 'betaBuildLocalizations'

      attributes do
        property :locale, required: true
        property :whats_new
      end
    end
  end
end
