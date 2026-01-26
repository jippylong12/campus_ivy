# frozen_string_literal: true

module CampusIvy
  module Resources
    class StudentReference
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

        response = @client.connection.get('StudentReference', params)
        CampusIvy::Object.new(response.body)
      end

      sig do
        params(
          student_id: String,
          reference_id: T.nilable(String),
          reference1: T.nilable(String),
          reference2: T.nilable(String),
          reference3: T.nilable(String),
          reference4: T.nilable(String),
          reference5: T.nilable(String)
        ).returns(CampusIvy::Object)
      end
      def create(
        student_id:,
        reference_id: nil,
        reference1: nil,
        reference2: nil,
        reference3: nil,
        reference4: nil,
        reference5: nil
      )
        payload = {
          StudentId: student_id,
          ReferenceId: reference_id,
          Reference1: reference1,
          Reference2: reference2,
          Reference3: reference3,
          Reference4: reference4,
          Reference5: reference5
        }.compact

        response = @client.connection.post('StudentReference') do |req|
          req.body = payload
        end
        CampusIvy::Object.new(response.body)
      end
    end
  end
end
