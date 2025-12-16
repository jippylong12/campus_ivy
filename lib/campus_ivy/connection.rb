# frozen_string_literal: true

require 'faraday'
require 'json'

module CampusIvy
  module Connection
    def connection
      @connection ||= Faraday.new(url: config.base_url) do |conn|
        conn.request :json

        # Authentication header
        conn.request :authorization, :Bearer, config.api_key if config.api_key

        conn.response :json, content_type: /\bjson$/

        # Custom middleware for handling errors could go here
        # conn.use CampusIvy::Middleware::ErrorHandler

        conn.adapter Faraday.default_adapter
      end
    end
  end
end
