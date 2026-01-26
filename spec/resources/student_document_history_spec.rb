# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CampusIvy::Resources::StudentDocumentHistory do
  let(:client) { CampusIvy::Client.new(token: 'test_api_key') }
  let(:resource) { client.student_document_history }
  let(:base_url) { 'https://api.campusivy.com/v1' }

  describe '#list' do
    it 'requests list' do
      stub_request(:get, "#{base_url}/StudentDocumentHistory")
        .with(query: { 'request.studentDocumentId' => '123' })
        .to_return(status: 200, body: '{"data": []}', headers: { 'Content-Type' => 'application/json' })

      resource.list(student_document_id: 123)
    end
  end
end
