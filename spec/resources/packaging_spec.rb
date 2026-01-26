# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CampusIvy::Resources::Packaging do
  let(:client) { CampusIvy::Client.new(token: 'test_api_key') }
  let(:resource) { client.packaging }
  let(:base_url) { 'https://api.campusivy.com/v1' }

  describe '#list' do
    it 'requests list' do
      stub_request(:get, "#{base_url}/Packaging")
        .with(query: { 'request.studentId' => 'S123' })
        .to_return(status: 200, body: '{"data": []}', headers: { 'Content-Type' => 'application/json' })

      resource.list(student_id: 'S123')
    end
  end

  describe '#import' do
    it 'posts data' do
      payload = [{ studentId: 'S123' }]
      stub_request(:post, "#{base_url}/Packaging")
        .with(
          query: { 'validateRecords' => 'true' },
          body: payload.to_json
        )
        .to_return(status: 200, body: '{}', headers: { 'Content-Type' => 'application/json' })

      resource.import(students: payload, validate_records: true)
    end
  end
end
