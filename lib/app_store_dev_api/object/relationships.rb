# frozen_string_literal: true

require 'active_support/concern'

module AppStoreDevApi
  module Object
    module Relationships
      extend ActiveSupport::Concern

      class_methods do
        def relationships(&block)
          self::Relationships.class_eval(&block)
        end
      end

      included do
        attr_reader :relationships

        klass = Class.new do |relationships|
          include Object::Properties

          relationships.send(:define_method, :initialize) do |**kwargs|
            self.class.properties.each do |name, options|
              raise ArgumentError, "#{name} required" if options[:required] && !kwargs.key?(name)

              value = kwargs.fetch(name, options[:default])

              instance_variable_set("@#{name}", value)
            end
          end

          def to_h
            {}.tap do |hash|
              self.class.properties.each_key do |name|
                value = instance_variable_get("@#{name}")

                hash[name] = value unless value.nil?
              end
            end
          end
        end

        const_set('Relationships', klass)
      end
    end
  end
end
