# frozen_string_literal: true

module AppStoreDevApi
  class BetaBuildLocalizationModifyRequest < Request::Body
    data do
      type 'betaBuildLocalizations'

      attributes do
        property :whats_new
      end
    end
  end
end
