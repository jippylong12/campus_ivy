# frozen_string_literal: true

module CampusIvy
  module Resources
    class StudentISIR
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

        response = @client.connection.get('StudentISIR', params)
        CampusIvy::Object.new(response.body)
      end

      sig { params(institution_isir_id: Integer).returns(CampusIvy::Object) }
      def verification_request(institution_isir_id:)
        params = {
          'institutionISIRId' => institution_isir_id
        }
        response = @client.connection.get('studentisir/verification-request', params)
        CampusIvy::Object.new(response.body)
      end

      sig do
        params(
          institution_isir_id: Integer,
          is_documents_cleared: T.nilable(T::Boolean),
          is_isir_cleared: T.nilable(T::Boolean),
          processing_status_id: T.nilable(String)
        ).returns(CampusIvy::Object)
      end
      def update_status(
        institution_isir_id:,
        is_documents_cleared: nil,
        is_isir_cleared: nil,
        processing_status_id: nil
      )
        payload = {
          InstitutionISIRId: institution_isir_id,
          IsDocumentsCleared: is_documents_cleared,
          IsISIRCleared: is_isir_cleared,
          ProcessingStatusId: processing_status_id
        }.compact

        response = @client.connection.post('UpdateStudentISIRStatus') do |req|
          req.body = payload
        end
        CampusIvy::Object.new(response.body)
      end
    end
  end
end
