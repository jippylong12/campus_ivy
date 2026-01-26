# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CampusIvy::Resources::RegisteredStudent do
  let(:client) { CampusIvy::Client.new(token: 'test_api_key') }
  let(:resource) { client.registered_student }
  let(:base_url) { 'https://api.campusivy.com/v1' }

  describe '#list' do
    it 'requests list' do
      stub_request(:get, "#{base_url}/RegisteredStudent")
        .with(query: { 'request.studentId' => 'S123' })
        .to_return(status: 200, body: '{"data": []}', headers: { 'Content-Type' => 'application/json' })

      resource.list(student_id: 'S123')
    end
  end

  describe '#create' do
    it 'posts data' do
      payload = { StudentId: 'S123', FirstName: 'John' }
      stub_request(:post, "#{base_url}/RegisteredStudent")
        .with(body: payload.to_json)
        .to_return(status: 200, body: '{}', headers: { 'Content-Type' => 'application/json' })

      resource.create(student_id: 'S123', first_name: 'John')
    end
  end
end
