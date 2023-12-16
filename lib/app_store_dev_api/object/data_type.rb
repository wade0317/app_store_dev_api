# frozen_string_literal: true

require 'active_support/concern'

module AppStoreDevApi
  module Object
    module DataType
      extend ActiveSupport::Concern

      class_methods do
        def data_type=(type)
          @data_type = type
        end
      end

      included do
        def data_type
          self.class.instance_variable_get('@data_type')
        end
      end
    end
  end
end
