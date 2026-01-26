# frozen_string_literal: true

module CampusIvy
  module Resources
    class FunctionalAreaTask
      extend T::Sig

      sig { params(client: CampusIvy::Client).void }
      def initialize(client)
        @client = client
      end

      sig do
        params(
          is_active: T.nilable(T::Boolean),
          start_date: T.nilable(String),
          end_date: T.nilable(String)
        ).returns(CampusIvy::Object)
      end
      def list(
        is_active: nil,
        start_date: nil,
        end_date: nil
      )
        params = {
          'request.isActive' => is_active,
          'request.startDate' => start_date,
          'request.endDate' => end_date
        }.compact

        response = @client.connection.get('FunctionalAreaTask', params)
        CampusIvy::Object.new(response.body)
      end

      sig { params(id: Integer).returns(CampusIvy::Object) }
      def show(id)
        response = @client.connection.get("FunctionalAreaTask/#{id}")
        CampusIvy::Object.new(response.body)
      end
    end
  end
end
