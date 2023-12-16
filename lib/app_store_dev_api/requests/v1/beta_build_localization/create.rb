# frozen_string_literal: true

module AppStoreDevApi
	module Requests
		module V1
			module BetaBuildLocalization
				class Create < Request::Body
					data do
					  type 'betaBuildLocalizations'

					  attributes do
					    property :locale, required: true
					    property :whats_new
					  end
					end
				end
			end
		end
	end 
end
