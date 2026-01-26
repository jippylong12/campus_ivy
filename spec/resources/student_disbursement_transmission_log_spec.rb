# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CampusIvy::Resources::StudentDisbursementTransmissionLog do
  let(:client) { CampusIvy::Client.new(token: 'test_api_key') }
  let(:resource) { client.student_disbursement_transmission_log }
  let(:base_url) { 'https://api.campusivy.com/v1' }

  describe '#list' do
    it 'requests list' do
      stub_request(:get, "#{base_url}/StudentDisbursementTransmissionLog")
        .with(query: { 'request.studentId' => 'S123' })
        .to_return(status: 200, body: '{"data": []}', headers: { 'Content-Type' => 'application/json' })

      resource.list(student_id: 'S123')
    end
  end
end
