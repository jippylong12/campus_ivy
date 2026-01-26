# frozen_string_literal: true

module CampusIvy
  module Resources
    class DocumentInventory
      extend T::Sig

      sig { params(client: CampusIvy::Client).void }
      def initialize(client)
        @client = client
      end

      sig do
        params(
          institution_document_id_list: T.nilable(String),
          start_date: T.nilable(String),
          end_date: T.nilable(String)
        ).returns(CampusIvy::Object)
      end
      def list(
        institution_document_id_list: nil,
        start_date: nil,
        end_date: nil
      )
        params = {
          'request.institutionDocumentIdList' => institution_document_id_list,
          'request.startDate' => start_date,
          'request.endDate' => end_date
        }.compact

        response = @client.connection.get('DocumentInventory', params)
        CampusIvy::Object.new(response.body)
      end
    end
  end
end
