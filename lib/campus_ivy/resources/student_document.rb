# frozen_string_literal: true

module CampusIvy
  module Resources
    class StudentDocument
      extend T::Sig

      sig { params(client: CampusIvy::Client).void }
      def initialize(client)
        @client = client
      end

      sig do
        params(
          institution_student_id: T.nilable(Integer),
          student_id_list: T.nilable(String),
          student_document_id: T.nilable(Integer),
          document_status_id: T.nilable(Integer),
          start_date: T.nilable(String),
          end_date: T.nilable(String),
          include_blob: T.nilable(T::Boolean)
        ).returns(CampusIvy::Object)
      end
      def list(
        institution_student_id: nil,
        student_id_list: nil,
        student_document_id: nil,
        document_status_id: nil,
        start_date: nil,
        end_date: nil,
        include_blob: nil
      )
        params = {
          'request.institutionStudentId' => institution_student_id,
          'request.studentIdList' => student_id_list,
          'request.studentDocumentId' => student_document_id,
          'request.documentStatusId' => document_status_id,
          'request.startDate' => start_date,
          'request.endDate' => end_date,
          'request.includeBlob' => include_blob
        }.compact

        response = @client.connection.get('StudentDocument', params)
        CampusIvy::Object.new(response.body)
      end

      sig do
        params(
          students_documents: T::Array[T::Hash[Symbol, T.untyped]],
          validate_records: T.nilable(T::Boolean),
          process_records: T.nilable(T::Boolean),
          batch_size: T.nilable(Integer),
          return_result: T.nilable(T::Boolean),
          response_type: T.nilable(String)
        ).returns(CampusIvy::Object)
      end
      def import(
        students_documents:,
        validate_records: nil,
        process_records: nil,
        batch_size: nil,
        return_result: nil,
        response_type: nil
      )
        params = {
          validateRecords: validate_records,
          processRecords: process_records,
          batchSize: batch_size,
          returnResult: return_result,
          responseType: response_type
        }.compact

        response = @client.connection.post('StudentDocument') do |req|
          req.params = params
          req.body = students_documents
        end
        CampusIvy::Object.new(response.body)
      end

      sig do
        params(
          institution_student_id: Integer,
          student_document_id: Integer,
          blob_search: T::Boolean
        ).returns(CampusIvy::Object)
      end
      def search_blob(
        institution_student_id:,
        student_document_id:,
        blob_search: true
      )
        params = {
          'request.institutionStudentId' => institution_student_id,
          'request.studentDocumentId' => student_document_id,
          'request.blobSearch' => blob_search
        }
        response = @client.connection.get('StudentDocument/Blob/Search', params)
        CampusIvy::Object.new(response.body)
      end

      sig { params(id: Integer).returns(CampusIvy::Object) }
      def status_options(id:)
        response = @client.connection.get("StudentDocument/#{id}/StatusOption")
        CampusIvy::Object.new(response.body)
      end
    end
  end
end
