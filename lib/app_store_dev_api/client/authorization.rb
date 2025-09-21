# frozen_string_literal: true

require 'jwt'

module AppStoreDevApi
  class Client
    class Authorization
      OPTIONS = %i[key_id issuer_id private_key].freeze

      AUDIENCE = 'appstoreconnect-v1'
      ALGORITHM = 'ES256'

      attr_reader(*OPTIONS)

      def initialize(options)
        @key_id = options.fetch(:key_id)
        @issuer_id = options.fetch(:issuer_id)
        @private_key = OpenSSL::PKey.read(options.fetch(:private_key))
      end

      def payload
        current_time = Time.now.to_i
        {
          iss: issuer_id,
          iat: current_time,
          exp: current_time + 20 * 60,
          aud: AUDIENCE
        }
      end

      def header_fields
        {
          kid: key_id,
          typ: 'JWT'
        }
      end

      def token
        JWT.encode(payload, private_key, ALGORITHM, header_fields)
      end
    end
  end
end
