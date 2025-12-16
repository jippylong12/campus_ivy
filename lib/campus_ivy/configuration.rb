# frozen_string_literal: true

module CampusIvy
  class Configuration
    attr_accessor :api_key, :base_url

    def initialize
      @api_key = nil
      @base_url = 'https://api.campusivy.com/v1' # Default URL example
    end
  end
end
