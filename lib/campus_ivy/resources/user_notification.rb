# frozen_string_literal: true

module CampusIvy
  module Resources
    class UserNotification
      extend T::Sig

      sig { params(client: CampusIvy::Client).void }
      def initialize(client)
        @client = client
      end

      sig do
        params(
          user_id: T.nilable(Integer),
          institution_student_id: T.nilable(Integer),
          start_date: T.nilable(String),
          end_date: T.nilable(String)
        ).returns(CampusIvy::Object)
      end
      def list(
        user_id: nil,
        institution_student_id: nil,
        start_date: nil,
        end_date: nil
      )
        params = {
          'request.userId' => user_id,
          'request.institutionStudentId' => institution_student_id,
          'request.startDate' => start_date,
          'request.endDate' => end_date
        }.compact

        response = @client.connection.get('UserNotification', params)
        CampusIvy::Object.new(response.body)
      end

      sig { params(id: Integer).returns(T.nilable(CampusIvy::Object)) }
      def mark_read(id:)
        response = @client.connection.post("UserNotification/Read/#{id}")
        # Assuming no body or empty body, wrap if needed
        return nil if response.body.nil? || response.body.empty?

        CampusIvy::Object.new(response.body)
      end
    end
  end
end
