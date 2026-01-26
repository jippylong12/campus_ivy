# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CampusIvy::Resources::DocumentStatus do
  let(:client) { CampusIvy::Client.new(token: 'test_api_key') }
  let(:resource) { client.document_status }
  let(:base_url) { 'https://api.campusivy.com/v1' }

  describe '#list' do
    it 'requests list' do
      stub_request(:get, "#{base_url}/DocumentStatus")
        .with(query: { 'request.startDate' => '2023-01-01' })
        .to_return(status: 200, body: '{"data": []}', headers: { 'Content-Type' => 'application/json' })

      resource.list(start_date: '2023-01-01')
    end
  end
end
