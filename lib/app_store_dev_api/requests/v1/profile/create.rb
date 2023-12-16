# frozen_string_literal: true



module AppStoreDevApi
  module Requests
    module V1
      module Profile
        class Create < Request::Body
		    data do
		      type 'profiles'

		      attributes do
		        property :name, required: true
		        property :profile_type, required: true
		      end
		    end
        end
      end
    end
  end
end




module AppStoreDevApi
  class ProfileCreateRequest < Request::Body

  end
end
