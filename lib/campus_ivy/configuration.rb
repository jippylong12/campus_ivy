# frozen_string_literal: true

module CampusIvy
  class Configuration
    attr_accessor :api_key
    attr_reader :sandbox, :base_url

    def initialize
      @api_key = nil
      @sandbox = ENV['CAMPUS_IVY_USE_SANDBOX'] == 'true'
      @base_url = @sandbox ? 'https://apisandbox.campusivy.com/Apis/CampusIvy.API/api' : 'https://api.campusivy.com/v1'
    end

    def sandbox=(value)
      @sandbox = value
      @base_url = @sandbox ? 'https://apisandbox.campusivy.com/Apis/CampusIvy.API/api' : 'https://api.campusivy.com/v1'
    end
  end
end
