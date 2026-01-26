# frozen_string_literal: true

module CampusIvy
  module Resources
    class ServiceType
      extend T::Sig

      sig { params(client: CampusIvy::Client).void }
      def initialize(client)
        @client = client
      end

      sig { returns(CampusIvy::Object) }
      def list
        response = @client.connection.get('serviceType')
        CampusIvy::Object.new(response.body)
      end
    end
  end
end
