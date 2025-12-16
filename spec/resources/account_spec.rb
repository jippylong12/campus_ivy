# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CampusIvy::Resources::Account do
  let(:client) { CampusIvy::Client.new(api_key: 'test_api_key') }
  let(:account) { client.account }
  let(:base_url) { 'https://api.campusivy.com/v1' }

  describe '#token' do
    let(:params) do
      {
        institution_id: 1,
        client_key: 'key',
        username: 'user',
        password: 'password'
      }
    end

    it 'requests an access token' do
      stub_request(:post, "#{base_url}/account/token")
        .with(
          body: {
            institutionId: 1,
            clientKey: 'key',
            userName: 'user',
            password: 'password'
          }.to_json
        )
        .to_return(status: 200, body: '{"access_token": "token123"}', headers: { 'Content-Type' => 'application/json' })

      response = account.token(**params)
      expect(response.access_token).to eq('token123')
    end
  end

  describe '#token_credentials' do
    let(:params) do
      {
        institution_id: 1,
        username: 'user',
        password: 'password'
      }
    end

    it 'requests an access token with credentials' do
      stub_request(:post, "#{base_url}/account/token/credentials")
        .with(
          body: {
            institutionId: 1,
            userName: 'user',
            password: 'password'
          }.to_json
        )
        .to_return(status: 200, body: '{"access_token": "token123"}', headers: { 'Content-Type' => 'application/json' })

      response = account.token_credentials(**params)
      expect(response.access_token).to eq('token123')
    end
  end

  describe '#token_key' do
    let(:params) do
      {
        institution_id: 1,
        client_key: 'key'
      }
    end

    it 'requests an access token with client key' do
      stub_request(:post, "#{base_url}/account/token/key")
        .with(
          body: {
            institutionId: 1,
            clientKey: 'key'
          }.to_json
        )
        .to_return(status: 200, body: '{"access_token": "token123"}', headers: { 'Content-Type' => 'application/json' })

      response = account.token_key(**params)
      expect(response.access_token).to eq('token123')
    end
  end

  describe '#logout' do
    it 'logs out successfully' do
      stub_request(:post, "#{base_url}/account/logout")
        .to_return(status: 204, body: '', headers: {})

      expect(account.logout).to be_nil
    end
  end
end
