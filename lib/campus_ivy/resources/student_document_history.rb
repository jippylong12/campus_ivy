# frozen_string_literal: true

module CampusIvy
  module Resources
    class StudentDocumentHistory
      extend T::Sig

      sig { params(client: CampusIvy::Client).void }
      def initialize(client)
        @client = client
      end

      sig do
        params(
          student_document_id: T.nilable(Integer),
          student_id: T.nilable(String),
          start_date: T.nilable(String),
          end_date: T.nilable(String)
        ).returns(CampusIvy::Object)
      end
      def list(
        student_document_id: nil,
        student_id: nil,
        start_date: nil,
        end_date: nil
      )
        params = {
          'request.studentDocumentId' => student_document_id,
          'request.studentId' => student_id,
          'request.startDate' => start_date,
          'request.endDate' => end_date
        }.compact

        response = @client.connection.get('StudentDocumentHistory', params)
        CampusIvy::Object.new(response.body)
      end
    end
  end
end
