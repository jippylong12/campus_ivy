# frozen_string_literal: true

module CampusIvy
  module Resources
    class DisbursementBatchDetail
      extend T::Sig

      sig { params(client: CampusIvy::Client).void }
      def initialize(client)
        @client = client
      end

      sig do
        params(
          institution_disbursement_batch_header_id_list: T.nilable(String),
          start_date: T.nilable(String),
          end_date: T.nilable(String)
        ).returns(CampusIvy::Object)
      end
      def list(
        institution_disbursement_batch_header_id_list: nil,
        start_date: nil,
        end_date: nil
      )
        params = {
          'request.institutionDisbursementBatchHeaderIdList' => institution_disbursement_batch_header_id_list,
          'request.startDate' => start_date,
          'request.endDate' => end_date
        }.compact

        response = @client.connection.get('DisbursementBatchDetail', params)
        CampusIvy::Object.new(response.body)
      end
    end
  end
end
