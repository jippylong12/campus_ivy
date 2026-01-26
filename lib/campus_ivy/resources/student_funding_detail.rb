# frozen_string_literal: true

module CampusIvy
  module Resources
    class StudentFundingDetail
      extend T::Sig

      sig { params(client: CampusIvy::Client).void }
      def initialize(client)
        @client = client
      end

      sig do
        params(
          cutoff_date: String,
          disbursement_date_start: String,
          disbursement_date_end: String,
          award_date_start: String,
          award_date_end: String,
          institution_student_id: T.nilable(Integer),
          award_year_id_list: T.nilable(String),
          fund_type_id_list: T.nilable(String),
          institution_fund_type_id_list: T.nilable(String),
          institution_entity_location_id_list: T.nilable(String),
          institution_entity_id_list: T.nilable(String),
          institution_student_disbursement_status_id_list: T.nilable(String),
          institution_enrollment_status_id_list: T.nilable(String)
        ).returns(CampusIvy::Object)
      end
      def list(
        cutoff_date:,
        disbursement_date_start:,
        disbursement_date_end:,
        award_date_start:,
        award_date_end:,
        institution_student_id: nil,
        award_year_id_list: nil,
        fund_type_id_list: nil,
        institution_fund_type_id_list: nil,
        institution_entity_location_id_list: nil,
        institution_entity_id_list: nil,
        institution_student_disbursement_status_id_list: nil,
        institution_enrollment_status_id_list: nil
      )
        params = {
          'request.cutOffDate' => cutoff_date,
          'request.disbursementDate_Start' => disbursement_date_start,
          'request.disbursementDate_End' => disbursement_date_end,
          'request.awardDate_Start' => award_date_start,
          'request.awardDate_End' => award_date_end,
          'request.institutionStudentId' => institution_student_id,
          'request.awardYearIdList' => award_year_id_list,
          'request.fundTypeIdList' => fund_type_id_list,
          'request.institutionFundTypeIdList' => institution_fund_type_id_list,
          'request.institutionEntityLocationIdList' => institution_entity_location_id_list,
          'request.institutionEntityIdList' => institution_entity_id_list,
          'request.institutionStudentDisbursementStatusIdList' => institution_student_disbursement_status_id_list,
          'request.institutionEnrollmentStatusIdList' => institution_enrollment_status_id_list
        }.compact

        response = @client.connection.get('StudentFundingDetail', params)
        CampusIvy::Object.new(response.body)
      end
    end
  end
end
