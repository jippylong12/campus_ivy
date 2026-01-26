# frozen_string_literal: true

module CampusIvy
  module Resources
    class StudentDocumentTags
      extend T::Sig

      sig { params(client: CampusIvy::Client).void }
      def initialize(client)
        @client = client
      end

      sig do
        params(
          student_id: T.nilable(String),
          start_date: T.nilable(String),
          end_date: T.nilable(String)
        ).returns(CampusIvy::Object)
      end
      def list(
        student_id: nil,
        start_date: nil,
        end_date: nil
      )
        params = {
          'request.studentId' => student_id,
          'request.startDate' => start_date,
          'request.endDate' => end_date
        }.compact

        response = @client.connection.get('StudentDocumentTags', params)
        CampusIvy::Object.new(response.body)
      end
    end
  end
end
