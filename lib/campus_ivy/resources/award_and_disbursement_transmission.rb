# frozen_string_literal: true

module CampusIvy
  module Resources
    class AwardAndDisbursementTransmission
      extend T::Sig

      sig { params(client: CampusIvy::Client).void }
      def initialize(client)
        @client = client
      end

      sig do
        params(
          start_date: T.nilable(String),
          end_date: T.nilable(String)
        ).returns(CampusIvy::Object)
      end
      def list(start_date: nil, end_date: nil)
        params = {
          'request.startDate' => start_date,
          'request.endDate' => end_date
        }.compact

        response = @client.connection.get('AwardAndDisbursementTransmission', params)
        CampusIvy::Object.new(response.body)
      end
    end
  end
end
