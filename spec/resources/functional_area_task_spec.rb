# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CampusIvy::Resources::FunctionalAreaTask do
  let(:client) { CampusIvy::Client.new(token: 'test_api_key') }
  let(:resource) { client.functional_area_task }
  let(:base_url) { 'https://api.campusivy.com/v1' }

  describe '#list' do
    it 'requests list' do
      stub_request(:get, "#{base_url}/FunctionalAreaTask")
        .with(query: { 'request.isActive' => 'true' })
        .to_return(status: 200, body: '{"data": []}', headers: { 'Content-Type' => 'application/json' })

      resource.list(is_active: true)
    end
  end

  describe '#show' do
    it 'requests item' do
      stub_request(:get, "#{base_url}/FunctionalAreaTask/1")
        .to_return(status: 200, body: '{}', headers: { 'Content-Type' => 'application/json' })

      resource.show(1)
    end
  end
end
