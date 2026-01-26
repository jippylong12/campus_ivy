# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CampusIvy::Resources::NoteType do
  let(:client) { CampusIvy::Client.new(token: 'test_api_key') }
  let(:resource) { client.note_type }
  let(:base_url) { 'https://api.campusivy.com/v1' }

  describe '#list' do
    it 'requests list' do
      stub_request(:get, "#{base_url}/NoteType")
        .to_return(status: 200, body: '{"data": []}', headers: { 'Content-Type' => 'application/json' })

      resource.list
    end
  end
end
