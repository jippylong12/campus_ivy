# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CampusIvy::Resources::UserNotification do
  let(:client) { CampusIvy::Client.new(token: 'test_api_key') }
  let(:resource) { client.user_notification }
  let(:base_url) { 'https://api.campusivy.com/v1' }

  describe '#list' do
    it 'requests list' do
      stub_request(:get, "#{base_url}/UserNotification")
        .with(query: { 'request.userId' => '1' })
        .to_return(status: 200, body: '{"data": []}', headers: { 'Content-Type' => 'application/json' })

      resource.list(user_id: 1)
    end
  end

  describe '#mark_read' do
    it 'posts read status' do
      stub_request(:post, "#{base_url}/UserNotification/Read/1")
        .to_return(status: 200, body: '{}', headers: { 'Content-Type' => 'application/json' })

      resource.mark_read(id: 1)
    end
  end
end
