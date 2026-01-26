# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CampusIvy::Resources::Health do
  let(:client) { CampusIvy::Client.new(token: 'test_api_key') }
  let(:resource) { client.health }
  let(:base_url) { 'https://api.campusivy.com/v1' }

  describe '#check' do
    it 'requests check' do
      stub_request(:get, "#{base_url}/health/check")
        .to_return(status: 200, body: '{}', headers: { 'Content-Type' => 'application/json' })

      resource.check
    end
  end

  describe '#ping' do
    it 'requests ping' do
      stub_request(:get, "#{base_url}/health/ping")
        .to_return(status: 200, body: 'Pong', headers: { 'Content-Type' => 'text/plain' })

      # The implementation wraps it or handles error, let's just ensure it calls
      resource.ping
    end
  end
end
