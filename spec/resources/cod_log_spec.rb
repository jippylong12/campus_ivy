# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CampusIvy::Resources::CODLog do
  let(:client) { CampusIvy::Client.new(token: 'test_api_key') }
  let(:resource) { client.cod_log }
  let(:base_url) { 'https://api.campusivy.com/v1' }

  describe '#list' do
    it 'requests list' do
      stub_request(:get, "#{base_url}/CODLog")
        .with(query: { 'request.ssn' => '123456789' })
        .to_return(status: 200, body: '{"data": []}', headers: { 'Content-Type' => 'application/json' })

      resource.list(ssn: '123456789')
    end
  end
end
