# frozen_string_literal: true

module CampusIvy
  module Resources
    class StudentDisbursementTransmissionLog
      extend T::Sig

      sig { params(client: CampusIvy::Client).void }
      def initialize(client)
        @client = client
      end

      sig do
        params(
          is_current: T.nilable(T::Boolean),
          student_id: T.nilable(String),
          message_wild_card: T.nilable(String),
          institution_disbursement_batch_header_id_list: T.nilable(String),
          batch_date: T.nilable(String),
          start_date: T.nilable(String),
          end_date: T.nilable(String)
        ).returns(CampusIvy::Object)
      end
      def list(
        is_current: nil,
        student_id: nil,
        message_wild_card: nil,
        institution_disbursement_batch_header_id_list: nil,
        batch_date: nil,
        start_date: nil,
        end_date: nil
      )
        params = {
          'request.isCurrent' => is_current,
          'request.studentId' => student_id,
          'request.messageWildCard' => message_wild_card,
          'request.institutionDisbursementBatchHeaderIdList' => institution_disbursement_batch_header_id_list,
          'request.batchDate' => batch_date,
          'request.startDate' => start_date,
          'request.endDate' => end_date
        }.compact

        response = @client.connection.get('StudentDisbursementTransmissionLog', params)
        CampusIvy::Object.new(response.body)
      end
    end
  end
end
