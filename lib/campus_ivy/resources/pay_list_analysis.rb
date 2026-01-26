# frozen_string_literal: true

module CampusIvy
  module Resources
    class PayListAnalysis
      extend T::Sig

      sig { params(client: CampusIvy::Client).void }
      def initialize(client)
        @client = client
      end

      sig do
        params(
          award_year_id_list: T.nilable(String),
          fund_type_id_list: T.nilable(String),
          institution_fund_type_id_list: T.nilable(String),
          transaction_type_id_list: T.nilable(String),
          institution_entity_id_list: T.nilable(String),
          institution_entity_location_id_list: T.nilable(String),
          institution_enrollment_status_id_list: T.nilable(String),
          student_id_list: T.nilable(String),
          start_date: T.nilable(String),
          end_date: T.nilable(String)
        ).returns(CampusIvy::Object)
      end
      def list(
        award_year_id_list: nil,
        fund_type_id_list: nil,
        institution_fund_type_id_list: nil,
        transaction_type_id_list: nil,
        institution_entity_id_list: nil,
        institution_entity_location_id_list: nil,
        institution_enrollment_status_id_list: nil,
        student_id_list: nil,
        start_date: nil,
        end_date: nil
      )
        params = {
          'request.awardYearIdList' => award_year_id_list,
          'request.fundTypeIdList' => fund_type_id_list,
          'request.institutionFundTypeIdList' => institution_fund_type_id_list,
          'request.transactionTypeIdList' => transaction_type_id_list,
          'request.institutionEntityIdList' => institution_entity_id_list,
          'request.institutionEntityLocationIdList' => institution_entity_location_id_list,
          'request.institutionEnrollmentStatusIdList' => institution_enrollment_status_id_list,
          'request.studentIdList' => student_id_list,
          'request.startDate' => start_date,
          'request.endDate' => end_date
        }.compact

        response = @client.connection.get('PayListAnalysis', params)
        CampusIvy::Object.new(response.body)
      end
    end
  end
end
