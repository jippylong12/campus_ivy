# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CampusIvy::Resources::StudentNote do
  let(:client) { CampusIvy::Client.new(token: 'test_api_key') }
  let(:resource) { client.student_note }
  let(:base_url) { 'https://api.campusivy.com/v1' }

  describe '#list' do
    it 'requests list' do
      stub_request(:get, "#{base_url}/StudentNote")
        .with(query: { 'request.institutionStudentId' => '123' })
        .to_return(status: 200, body: '{"data": []}', headers: { 'Content-Type' => 'application/json' })

      resource.list(institution_student_id: 123)
    end
  end

  describe '#create' do
    it 'posts data' do
      payload = { StudentId: 'S123', NoteTypeId: 1, Note: 'Content', Subject: 'Sub' }
      stub_request(:post, "#{base_url}/StudentNote")
        .with(body: payload.to_json)
        .to_return(status: 200, body: '{}', headers: { 'Content-Type' => 'application/json' })

      resource.create(student_id: 'S123', note_type_id: 1, note: 'Content', subject: 'Sub')
    end
  end
end
