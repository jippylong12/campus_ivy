# frozen_string_literal: true

module CampusIvy
  module Resources
    class StudentFAProgression
      extend T::Sig

      sig { params(client: CampusIvy::Client).void }
      def initialize(client)
        @client = client
      end

      sig do
        params(
          institution_student_id: T.nilable(Integer),
          student_id_list: T.nilable(String),
          lead_source: T.nilable(String),
          include_enrollment_update: T.nilable(T::Boolean),
          include_isir_update: T.nilable(T::Boolean),
          include_document_update: T.nilable(T::Boolean),
          include_notification_update: T.nilable(T::Boolean),
          include_funding_estimate_update: T.nilable(T::Boolean),
          include_disbursement_update: T.nilable(T::Boolean),
          start_date: T.nilable(String),
          end_date: T.nilable(String)
        ).returns(CampusIvy::Object)
      end
      def list(
        institution_student_id: nil,
        student_id_list: nil,
        lead_source: nil,
        include_enrollment_update: nil,
        include_isir_update: nil,
        include_document_update: nil,
        include_notification_update: nil,
        include_funding_estimate_update: nil,
        include_disbursement_update: nil,
        start_date: nil,
        end_date: nil
      )
        params = {
          'request.institutionStudentId' => institution_student_id,
          'request.studentIdList' => student_id_list,
          'request.leadSource' => lead_source,
          'request.includeEnrollmentUpdate' => include_enrollment_update,
          'request.includeISIRUpdate' => include_isir_update,
          'request.includeDocumentUpdate' => include_document_update,
          'request.includeNotificationUpdate' => include_notification_update,
          'request.includeFundingEstimateUpdate' => include_funding_estimate_update,
          'request.includeDisbursementUpdate' => include_disbursement_update,
          'request.startDate' => start_date,
          'request.endDate' => end_date
        }.compact

        response = @client.connection.get('StudentFAProgression', params)
        CampusIvy::Object.new(response.body)
      end
    end
  end
end
