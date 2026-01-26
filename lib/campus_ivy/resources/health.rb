# frozen_string_literal: true

module CampusIvy
  module Resources
    class Health
      extend T::Sig

      sig { params(client: CampusIvy::Client).void }
      def initialize(client)
        @client = client
      end

      sig { returns(CampusIvy::Object) }
      def check
        response = @client.connection.get('health/check')
        CampusIvy::Object.new(response.body)
      end

      sig { returns(String) }
      def ping
        # Ping returns plain string "Pong"
        response = @client.connection.get('health/ping')
        response.body.to_s
      end
    end
  end
end
