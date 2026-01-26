# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CampusIvy::Resources::DocumentAnalysis do
  let(:client) { CampusIvy::Client.new(token: 'test_api_key') }
  let(:resource) { client.document_analysis }
  let(:base_url) { 'https://api.campusivy.com/v1' }

  describe '#list' do
    it 'requests list' do
      stub_request(:get, "#{base_url}/DocumentAnalysis")
        .with(query: { 'request.institutionStudentId' => '123' })
        .to_return(status: 200, body: '{"data": []}', headers: { 'Content-Type' => 'application/json' })

      resource.list(institution_student_id: 123)
    end
  end
end
