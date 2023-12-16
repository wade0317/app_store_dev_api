# frozen_string_literal: true

module AppStoreDevApi
  class Schema
    class Object
      attr_reader :type, :properties

      def initialize(options)
        @type = options.fetch(:type)
        @properties = options.fetch(:properties)
      end
    end
  end
end
