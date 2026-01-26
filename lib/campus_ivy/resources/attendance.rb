# frozen_string_literal: true

module CampusIvy
  module Resources
    class Attendance
      extend T::Sig

      sig { params(client: CampusIvy::Client).void }
      def initialize(client)
        @client = client
      end

      sig do
        params(
          institution_import_file_id: T.nilable(Integer),
          import_processing_status_id: T.nilable(String),
          student_id: T.nilable(String),
          has_errors: T.nilable(T::Boolean),
          has_warnings: T.nilable(T::Boolean),
          start_date: T.nilable(String),
          end_date: T.nilable(String)
        ).returns(CampusIvy::Object)
      end
      def list(
        institution_import_file_id: nil,
        import_processing_status_id: nil,
        student_id: nil,
        has_errors: nil,
        has_warnings: nil,
        start_date: nil,
        end_date: nil
      )
        params = {
          'request.institutionImportFileId' => institution_import_file_id,
          'request.importProcessingStatusId' => import_processing_status_id,
          'request.studentId' => student_id,
          'request.hasErrors' => has_errors,
          'request.hasWarnings' => has_warnings,
          'request.startDate' => start_date,
          'request.endDate' => end_date
        }.compact

        response = @client.connection.get('Attendance', params)
        CampusIvy::Object.new(response.body)
      end

      sig do
        params(
          students_attendances: T::Array[T::Hash[Symbol, T.untyped]],
          file_source: T.nilable(String),
          validate_records: T.nilable(T::Boolean),
          process_records: T.nilable(T::Boolean),
          return_result: T.nilable(T::Boolean),
          batch_size: T.nilable(Integer),
          response_type: T.nilable(String)
        ).returns(CampusIvy::Object)
      end
      def import(
        students_attendances:,
        file_source: nil,
        validate_records: nil,
        process_records: nil,
        return_result: nil,
        batch_size: nil,
        response_type: nil
      )
        query_params = {
          fileSource: file_source,
          validateRecords: validate_records,
          processRecords: process_records,
          returnResult: return_result,
          batchSize: batch_size,
          responseType: response_type
        }.compact

        response = @client.connection.post('Attendance') do |req|
          req.params = query_params
          req.body = students_attendances
        end

        CampusIvy::Object.new(response.body)
      end
    end
  end
end
