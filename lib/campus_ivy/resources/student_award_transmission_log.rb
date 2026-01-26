# frozen_string_literal: true

module CampusIvy
  module Resources
    class StudentAwardTransmissionLog
      extend T::Sig

      sig { params(client: CampusIvy::Client).void }
      def initialize(client)
        @client = client
      end

      sig do
        params(
          batch_sync_id: T.nilable(Integer),
          integration_system: T.nilable(String),
          is_current: T.nilable(T::Boolean),
          integration_award_posted_status: T.nilable(String),
          student_id: T.nilable(String),
          message_wild_card: T.nilable(String),
          institution_student_award_id: T.nilable(Integer),
          institution_student_id: T.nilable(Integer),
          institution_disbursement_batch_header_id_list: T.nilable(String),
          is_status_update: T.nilable(T::Boolean),
          is_academic_year_update: T.nilable(T::Boolean),
          batch_date: T.nilable(String),
          start_date: T.nilable(String),
          end_date: T.nilable(String)
        ).returns(CampusIvy::Object)
      end
      def list(
        batch_sync_id: nil,
        integration_system: nil,
        is_current: nil,
        integration_award_posted_status: nil,
        student_id: nil,
        message_wild_card: nil,
        institution_student_award_id: nil,
        institution_student_id: nil,
        institution_disbursement_batch_header_id_list: nil,
        is_status_update: nil,
        is_academic_year_update: nil,
        batch_date: nil,
        start_date: nil,
        end_date: nil
      )
        params = {
          'request.batchSyncId' => batch_sync_id,
          'request.integrationSystem' => integration_system,
          'request.isCurrent' => is_current,
          'request.integrationAwardPostedStatus' => integration_award_posted_status,
          'request.studentId' => student_id,
          'request.messageWildCard' => message_wild_card,
          'request.institutionStudentAwardId' => institution_student_award_id,
          'request.institutionStudentId' => institution_student_id,
          'request.institutionDisbursementBatchHeaderIdList' => institution_disbursement_batch_header_id_list,
          'request.isStatusUpdate' => is_status_update,
          'request.isAcademicYearUpdate' => is_academic_year_update,
          'request.batchDate' => batch_date,
          'request.startDate' => start_date,
          'request.endDate' => end_date
        }.compact

        response = @client.connection.get('StudentAwardTransmissionLog', params)
        CampusIvy::Object.new(response.body)
      end
    end
  end
end
