# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CampusIvy::Resources::StudentFundingDetail do
  let(:client) { CampusIvy::Client.new(token: 'test_api_key') }
  let(:resource) { client.student_funding_detail }
  let(:base_url) { 'https://api.campusivy.com/v1' }

  describe '#list' do
    it 'requests list' do
      stub_request(:get, "#{base_url}/StudentFundingDetail")
        .with(query: {
                'request.cutOffDate' => '2023-01-01',
                'request.disbursementDate_Start' => '2023-01-01',
                'request.disbursementDate_End' => '2023-01-31',
                'request.awardDate_Start' => '2023-01-01',
                'request.awardDate_End' => '2023-01-31'
              })
        .to_return(status: 200, body: '{"data": []}', headers: { 'Content-Type' => 'application/json' })

      resource.list(
        cutoff_date: '2023-01-01',
        disbursement_date_start: '2023-01-01',
        disbursement_date_end: '2023-01-31',
        award_date_start: '2023-01-01',
        award_date_end: '2023-01-31'
      )
    end
  end
end
