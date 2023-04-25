# frozen_string_literal: true

module AppStoreConnectApi
  class ProfileCreateRequest < Request::Body
    data do
      type 'profiles'

      attributes do
        property :name, required: true
        property :profile_type, required: true
      end
    end
  end
end
