# frozen_string_literal: true

module CampusIvy
  module Resources
    class CODLog
      extend T::Sig

      sig { params(client: CampusIvy::Client).void }
      def initialize(client)
        @client = client
      end

      sig do
        params(
          financial_award_id: T.nilable(String),
          document_id: T.nilable(String),
          ssn: T.nilable(String),
          start_date: T.nilable(String),
          end_date: T.nilable(String)
        ).returns(CampusIvy::Object)
      end
      def list(
        financial_award_id: nil,
        document_id: nil,
        ssn: nil,
        start_date: nil,
        end_date: nil
      )
        params = {
          'request.financialAwardId' => financial_award_id,
          'request.documentId' => document_id,
          'request.ssn' => ssn,
          'request.startDate' => start_date,
          'request.endDate' => end_date
        }.compact

        response = @client.connection.get('CODLog', params)
        CampusIvy::Object.new(response.body)
      end
    end
  end
end
