# frozen_string_literal: true

module CampusIvy
  module Resources
    class Account
      extend T::Sig

      sig { params(client: CampusIvy::Client).void }
      def initialize(client)
        @client = client
      end

      sig do
        params(
          institution_id: Integer,
          client_key: String,
          username: String,
          password: String
        ).returns(CampusIvy::Object)
      end
      def token(institution_id:, client_key:, username:, password:)
        response = @client.connection.post('account/token') do |req|
          req.body = {
            institutionId: institution_id,
            clientKey: client_key,
            userName: username,
            password: password
          }
        end
        CampusIvy::Object.new(response.body)
      end

      sig do
        params(
          institution_id: Integer,
          username: String,
          password: String
        ).returns(CampusIvy::Object)
      end
      def token_credentials(institution_id:, username:, password:)
        response = @client.connection.post('account/token/credentials') do |req|
          req.body = {
            institutionId: institution_id,
            userName: username,
            password: password
          }
        end
        CampusIvy::Object.new(response.body)
      end

      sig do
        params(
          institution_id: Integer,
          client_key: String
        ).returns(CampusIvy::Object)
      end
      def token_key(institution_id:, client_key:)
        response = @client.connection.post('account/token/key') do |req|
          req.body = {
            institutionId: institution_id,
            clientKey: client_key
          }
        end
        CampusIvy::Object.new(response.body)
      end

      sig { returns(T.nilable(CampusIvy::Object)) }
      def logout
        response = @client.connection.post('account/logout')
        return nil if response.body.nil? || response.body.empty?

        CampusIvy::Object.new(response.body)
      end
    end
  end
end
