# frozen_string_literal: true



module AppStoreDevApi
	module Requests
		module V1
			module BetaBuildLocalization
				class Update < Request::Body
					data do
					  type 'betaBuildLocalizations'

				      attributes do
				        property :whats_new
				      end
					end
				end
			end
		end
	end 
end

