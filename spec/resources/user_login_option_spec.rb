# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CampusIvy::Resources::UserLoginOption do
  let(:client) { CampusIvy::Client.new(token: 'test_api_key') }
  let(:resource) { client.user_login_option }
  let(:base_url) { 'https://api.campusivy.com/v1' }

  describe '#list' do
    it 'requests list' do
      stub_request(:get, "#{base_url}/UserLoginOption")
        .with(query: { 'request.userId' => '1' })
        .to_return(status: 200, body: '{"data": []}', headers: { 'Content-Type' => 'application/json' })

      resource.list(user_id: 1)
    end
  end
end
