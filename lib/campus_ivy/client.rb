# frozen_string_literal: true

require_relative 'configuration'
require_relative 'connection'

module CampusIvy
  class Client
    extend T::Sig
    include CampusIvy::Connection

    attr_reader :config

    def initialize(options = {})
      # Initialize with global config values, overridden by options
      @config = CampusIvy::Configuration.new

      # Copy global configuration
      CampusIvy.configuration.instance_variables.each do |var|
        val = CampusIvy.configuration.instance_variable_get(var)
        @config.instance_variable_set(var, val)
      end

      # Override with instance options
      options.each do |key, value|
        @config.send("#{key}=", value) if @config.respond_to?("#{key}=")
      end
    end

    sig { returns(CampusIvy::Resources::Account) }
    def account
      Resources::Account.new(self)
    end
  end
end
