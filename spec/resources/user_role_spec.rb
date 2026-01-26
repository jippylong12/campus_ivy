# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CampusIvy::Resources::UserRole do
  let(:client) { CampusIvy::Client.new(token: 'test_api_key') }
  let(:resource) { client.user_role }
  let(:base_url) { 'https://api.campusivy.com/v1' }

  describe '#list' do
    it 'requests list' do
      stub_request(:get, "#{base_url}/UserRole")
        .with(query: { 'request.userRoleId' => '1' })
        .to_return(status: 200, body: '{"data": []}', headers: { 'Content-Type' => 'application/json' })

      resource.list(user_role_id: 1)
    end
  end

  describe '#functional_area_task_xref' do
    it 'requests xref list' do
      stub_request(:get, "#{base_url}/UserRole_FunctionalAreaTask_XRef")
        .with(query: { 'request.userRoleId' => '1' })
        .to_return(status: 200, body: '{"data": []}', headers: { 'Content-Type' => 'application/json' })

      resource.functional_area_task_xref(user_role_id: 1)
    end
  end
end
