# frozen_string_literal: true

module CampusIvy
  class Configuration
    attr_accessor :token, :base_url
    attr_reader :sandbox

    def initialize
      @token = nil
      @sandbox = ENV['CAMPUS_IVY_USE_SANDBOX'] == 'true'
      @base_url = @sandbox ? 'https://apisandbox.campusivy.com/Apis/CampusIvy.API/api' : 'https://api.campusivy.com/v1'
    end

    def sandbox=(value)
      @sandbox = value
      @base_url = @sandbox ? 'https://apisandbox.campusivy.com/Apis/CampusIvy.API/api' : 'https://api.campusivy.com/v1'
    end
  end
end
