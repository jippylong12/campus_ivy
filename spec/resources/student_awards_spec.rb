# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CampusIvy::Resources::StudentAwards do
  let(:client) { CampusIvy::Client.new(token: 'test_api_key') }
  let(:resource) { client.student_awards }
  let(:base_url) { 'https://api.campusivy.com/v1' }

  describe '#list' do
    it 'requests list' do
      stub_request(:get, "#{base_url}/StudentAwards")
        .with(query: { 'request.institutionStudentId' => '123' })
        .to_return(status: 200, body: '{"data": []}', headers: { 'Content-Type' => 'application/json' })

      resource.list(institution_student_id: 123)
    end
  end

  describe '#get_pell_grant_min_max' do
    it 'requests pell grant info' do
      stub_request(:get, "#{base_url}/StudentAwards/GetPellGrantMinMax/2023")
        .to_return(status: 200, body: '{}', headers: { 'Content-Type' => 'application/json' })

      resource.get_pell_grant_min_max(award_year_id: 2023)
    end
  end
end
