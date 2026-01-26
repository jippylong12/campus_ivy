# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CampusIvy::Resources::StudentDocument do
  let(:client) { CampusIvy::Client.new(token: 'test_api_key') }
  let(:resource) { client.student_document }
  let(:base_url) { 'https://api.campusivy.com/v1' }

  describe '#list' do
    it 'requests list' do
      stub_request(:get, "#{base_url}/StudentDocument")
        .with(query: { 'request.institutionStudentId' => '123' })
        .to_return(status: 200, body: '{"data": []}', headers: { 'Content-Type' => 'application/json' })

      resource.list(institution_student_id: 123)
    end
  end

  describe '#import' do
    it 'posts data' do
      payload = [{ studentId: 'S123', documentName: 'Test' }]
      stub_request(:post, "#{base_url}/StudentDocument")
        .with(query: { 'validateRecords' => 'true' }, body: payload.to_json)
        .to_return(status: 200, body: '{}', headers: { 'Content-Type' => 'application/json' })

      resource.import(students_documents: payload, validate_records: true)
    end
  end
end
