# frozen_string_literal: true

module CampusIvy
  module Resources
    class RegisteredStudent
      extend T::Sig

      sig { params(client: CampusIvy::Client).void }
      def initialize(client)
        @client = client
      end

      sig do
        params(
          student_id: String,
          registered_student_id: T.nilable(String),
          email_address: T.nilable(String),
          first_name: T.nilable(String),
          last_name: T.nilable(String),
          mobile_phone_number: T.nilable(String),
          dob: T.nilable(String),
          address1: T.nilable(String),
          address2: T.nilable(String),
          city: T.nilable(String),
          state: T.nilable(String),
          zip: T.nilable(String),
          country: T.nilable(String)
        ).returns(CampusIvy::Object)
      end
      def create(
        student_id:,
        registered_student_id: nil,
        email_address: nil,
        first_name: nil,
        last_name: nil,
        mobile_phone_number: nil,
        dob: nil,
        address1: nil,
        address2: nil,
        city: nil,
        state: nil,
        zip: nil,
        country: nil
      )
        payload = {
          StudentId: student_id,
          RegisteredStudentId: registered_student_id,
          EmailAddress: email_address,
          FirstName: first_name,
          LastName: last_name,
          MobilePhoneNumber: mobile_phone_number,
          DOB: dob,
          Address1: address1,
          Address2: address2,
          City: city,
          State: state,
          Zip: zip,
          Country: country
        }.compact

        response = @client.connection.post('RegisteredStudent') do |req|
          req.body = payload
        end
        CampusIvy::Object.new(response.body)
      end

      sig do
        params(
          student_id: T.nilable(String),
          email_address: T.nilable(String)
        ).returns(CampusIvy::Object)
      end
      def list(student_id: nil, email_address: nil)
        params = {
          'request.studentId' => student_id,
          'request.emailAddress' => email_address
        }.compact

        response = @client.connection.get('RegisteredStudent', params)
        CampusIvy::Object.new(response.body)
      end
    end
  end
end
