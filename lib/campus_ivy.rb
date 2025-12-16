# frozen_string_literal: true

require_relative 'campus_ivy/version'
require 'sorbet-runtime'
require_relative 'campus_ivy/configuration'
require_relative 'campus_ivy/object'
require_relative 'campus_ivy/resources/account'
require_relative 'campus_ivy/client'

module CampusIvy
  class Error < StandardError; end
  class RateLimitError < Error; end

  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end
end
