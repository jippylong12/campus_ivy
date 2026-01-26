# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CampusIvy::Resources::Attendance do
  let(:client) { CampusIvy::Client.new(token: 'test_api_key') }
  let(:attendance) { client.attendance }
  let(:base_url) { 'https://api.campusivy.com/v1' }

  describe '#list' do
    let(:params) do
      {
        institution_import_file_id: 123,
        start_date: '2023-01-01',
        end_date: '2023-01-31'
      }
    end

    it 'requests attendance list' do
      stub_request(:get, "#{base_url}/Attendance")
        .with(
          query: {
            'request.institutionImportFileId' => '123',
            'request.startDate' => '2023-01-01',
            'request.endDate' => '2023-01-31'
          }
        )
        .to_return(status: 200, body: '{"data": []}', headers: { 'Content-Type' => 'application/json' })

      attendance.list(**params)
    end
  end

  describe '#import' do
    let(:payload) do
      [
        {
          studentId: 'S123',
          attendanceDate: '2023-01-01',
          earnedMinutes: 60
        }
      ]
    end

    it 'posts attendance data' do
      stub_request(:post, "#{base_url}/Attendance")
        .with(
          query: {
            'validateRecords' => 'true'
          },
          body: payload.to_json
        )
        .to_return(status: 200, body: '{}', headers: { 'Content-Type' => 'application/json' })

      attendance.import(students_attendances: payload, validate_records: true)
    end
  end
end
