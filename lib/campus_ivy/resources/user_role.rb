# frozen_string_literal: true

module CampusIvy
  module Resources
    class UserRole
      extend T::Sig

      sig { params(client: CampusIvy::Client).void }
      def initialize(client)
        @client = client
      end

      sig do
        params(
          user_role_id: T.nilable(Integer),
          start_date: T.nilable(String),
          end_date: T.nilable(String)
        ).returns(CampusIvy::Object)
      end
      def list(
        user_role_id: nil,
        start_date: nil,
        end_date: nil
      )
        params = {
          'request.userRoleId' => user_role_id,
          'request.startDate' => start_date,
          'request.endDate' => end_date
        }.compact

        response = @client.connection.get('UserRole', params)
        CampusIvy::Object.new(response.body)
      end

      sig do
        params(
          user_role_id: T.nilable(Integer),
          start_date: T.nilable(String),
          end_date: T.nilable(String)
        ).returns(CampusIvy::Object)
      end
      def functional_area_task_xref(
        user_role_id: nil,
        start_date: nil,
        end_date: nil
      )
        params = {
          'request.userRoleId' => user_role_id,
          'request.startDate' => start_date,
          'request.endDate' => end_date
        }.compact

        response = @client.connection.get('UserRole_FunctionalAreaTask_XRef', params)
        CampusIvy::Object.new(response.body)
      end
    end
  end
end
