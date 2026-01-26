# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CampusIvy::Resources::StudentISIR do
  let(:client) { CampusIvy::Client.new(token: 'test_api_key') }
  let(:resource) { client.student_isir }
  let(:base_url) { 'https://api.campusivy.com/v1' }

  describe '#list' do
    it 'requests list' do
      stub_request(:get, "#{base_url}/StudentISIR")
        .with(query: { 'request.institutionStudentId' => '123' })
        .to_return(status: 200, body: '{"data": []}', headers: { 'Content-Type' => 'application/json' })

      resource.list(institution_student_id: 123)
    end
  end

  describe '#verification_request' do
    it 'requests verification info' do
      stub_request(:get, "#{base_url}/studentisir/verification-request")
        .with(query: { 'institutionISIRId' => '999' })
        .to_return(status: 200, body: '{}', headers: { 'Content-Type' => 'application/json' })

      resource.verification_request(institution_isir_id: 999)
    end
  end

  describe '#update_status' do
    it 'posts status update' do
      payload = { InstitutionISIRId: 999, ProcessingStatusId: 'C' }
      stub_request(:post, "#{base_url}/UpdateStudentISIRStatus")
        .with(body: payload.to_json)
        .to_return(status: 200, body: '{}', headers: { 'Content-Type' => 'application/json' })

      resource.update_status(institution_isir_id: 999, processing_status_id: 'C')
    end
  end
end
