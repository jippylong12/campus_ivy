# frozen_string_literal: true

require 'ostruct'

module CampusIvy
  class Object < OpenStruct
    def initialize(attributes = {})
      super(
        attributes.transform_values do |value|
          if value.is_a?(Hash)
            CampusIvy::Object.new(value)
          elsif value.is_a?(Array)
            value.map { |v| v.is_a?(Hash) ? CampusIvy::Object.new(v) : v }
          else
            value
          end
        end
      )
    end

    def method_missing(method, *args, &block)
      if encoding_aware? && method.to_s.end_with?('=')
        super
      else
        value = super
        if value.is_a?(Hash)
          CampusIvy::Object.new(value)
        elsif value.is_a?(Array)
          value.map { |v| v.is_a?(Hash) ? CampusIvy::Object.new(v) : v }
        else
          value
        end
      end
    end

    private

    def encoding_aware?
      defined?(::Encoding)
    end
  end
end
