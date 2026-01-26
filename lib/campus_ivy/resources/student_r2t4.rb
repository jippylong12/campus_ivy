# frozen_string_literal: true

module CampusIvy
  module Resources
    class StudentR2T4
      extend T::Sig

      sig { params(client: CampusIvy::Client).void }
      def initialize(client)
        @client = client
      end

      sig do
        params(
          institution_student_id: T.nilable(Integer),
          student_id_list: T.nilable(String),
          start_date: T.nilable(String),
          end_date: T.nilable(String)
        ).returns(CampusIvy::Object)
      end
      def list(
        institution_student_id: nil,
        student_id_list: nil,
        start_date: nil,
        end_date: nil
      )
        params = {
          'request.institutionStudentId' => institution_student_id,
          'request.studentIdList' => student_id_list,
          'request.startDate' => start_date,
          'request.endDate' => end_date
        }.compact

        response = @client.connection.get('StudentR2T4', params)
        CampusIvy::Object.new(response.body)
      end
    end
  end
end
