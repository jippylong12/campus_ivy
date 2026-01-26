# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CampusIvy::Resources::InstitutionBreaksByShift do
  let(:client) { CampusIvy::Client.new(token: 'test_api_key') }
  let(:resource) { client.institution_breaks_by_shift }
  let(:base_url) { 'https://api.campusivy.com/v1' }

  describe '#list' do
    it 'requests list' do
      stub_request(:get, "#{base_url}/InstitutionBreaksByShift")
        .with(query: { 'request.startDate' => '2023-01-01' })
        .to_return(status: 200, body: '{"data": []}', headers: { 'Content-Type' => 'application/json' })

      resource.list(start_date: '2023-01-01')
    end
  end
end
