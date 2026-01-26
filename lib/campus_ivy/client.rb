# frozen_string_literal: true

require_relative 'configuration'
require_relative 'connection'

module CampusIvy
  class Client
    extend T::Sig
    include CampusIvy::Connection

    attr_reader :config

    def initialize(options = {})
      # Initialize with global config values, overridden by options
      @config = CampusIvy::Configuration.new

      # Copy global configuration
      CampusIvy.configuration.instance_variables.each do |var|
        val = CampusIvy.configuration.instance_variable_get(var)
        @config.instance_variable_set(var, val)
      end

      # Override with instance options
      options.each do |key, value|
        @config.send("#{key}=", value) if @config.respond_to?("#{key}=")
      end
    end

    sig { returns(CampusIvy::Resources::Account) }
    def account
      Resources::Account.new(self)
    end

    sig { returns(CampusIvy::Resources::Attendance) }
    def attendance
      Resources::Attendance.new(self)
    end

    sig { returns(CampusIvy::Resources::AwardAndDisbursementTransmission) }
    def award_and_disbursement_transmission
      Resources::AwardAndDisbursementTransmission.new(self)
    end

    sig { returns(CampusIvy::Resources::DisbursementBatchDetail) }
    def disbursement_batch_detail
      Resources::DisbursementBatchDetail.new(self)
    end

    sig { returns(CampusIvy::Resources::Packaging) }
    def packaging
      Resources::Packaging.new(self)
    end

    sig { returns(CampusIvy::Resources::StudentAwards) }
    def student_awards
      Resources::StudentAwards.new(self)
    end

    sig { returns(CampusIvy::Resources::StudentAwardTransmissionLog) }
    def student_award_transmission_log
      Resources::StudentAwardTransmissionLog.new(self)
    end

    sig { returns(CampusIvy::Resources::StudentDisbursementTransmissionLog) }
    def student_disbursement_transmission_log
      Resources::StudentDisbursementTransmissionLog.new(self)
    end

    sig { returns(CampusIvy::Resources::CODLog) }
    def cod_log
      Resources::CODLog.new(self)
    end

    sig { returns(CampusIvy::Resources::CODResponseEC) }
    def cod_response_ec
      Resources::CODResponseEC.new(self)
    end

    sig { returns(CampusIvy::Resources::CODResponsePN) }
    def cod_response_pn
      Resources::CODResponsePN.new(self)
    end

    sig { returns(CampusIvy::Resources::CODResponseSP) }
    def cod_response_sp
      Resources::CODResponseSP.new(self)
    end

    sig { returns(CampusIvy::Resources::StudentISIR) }
    def student_isir
      Resources::StudentISIR.new(self)
    end

    sig { returns(CampusIvy::Resources::StudentSelectedISIR) }
    def student_selected_isir
      Resources::StudentSelectedISIR.new(self)
    end

    sig { returns(CampusIvy::Resources::StudentR2T4) }
    def student_r2t4
      Resources::StudentR2T4.new(self)
    end

    sig { returns(CampusIvy::Resources::NetPriceCalculator) }
    def net_price_calculator
      Resources::NetPriceCalculator.new(self)
    end

    sig { returns(CampusIvy::Resources::PayListAnalysis) }
    def pay_list_analysis
      Resources::PayListAnalysis.new(self)
    end

    sig { returns(CampusIvy::Resources::StudentFAProgression) }
    def student_fa_progression
      Resources::StudentFAProgression.new(self)
    end

    sig { returns(CampusIvy::Resources::StudentFundingDetail) }
    def student_funding_detail
      Resources::StudentFundingDetail.new(self)
    end

    sig { returns(CampusIvy::Resources::StudentFundingEstimate) }
    def student_funding_estimate
      Resources::StudentFundingEstimate.new(self)
    end

    sig { returns(CampusIvy::Resources::StudentRemainingBalance) }
    def student_remaining_balance
      Resources::StudentRemainingBalance.new(self)
    end

    sig { returns(CampusIvy::Resources::DocumentAnalysis) }
    def document_analysis
      Resources::DocumentAnalysis.new(self)
    end

    sig { returns(CampusIvy::Resources::DocumentInventory) }
    def document_inventory
      Resources::DocumentInventory.new(self)
    end

    sig { returns(CampusIvy::Resources::DocumentStatus) }
    def document_status
      Resources::DocumentStatus.new(self)
    end

    sig { returns(CampusIvy::Resources::StudentDocument) }
    def student_document
      Resources::StudentDocument.new(self)
    end

    sig { returns(CampusIvy::Resources::StudentDocumentHistory) }
    def student_document_history
      Resources::StudentDocumentHistory.new(self)
    end

    sig { returns(CampusIvy::Resources::StudentDocumentTags) }
    def student_document_tags
      Resources::StudentDocumentTags.new(self)
    end

    sig { returns(CampusIvy::Resources::FunctionalAreaTask) }
    def functional_area_task
      Resources::FunctionalAreaTask.new(self)
    end

    sig { returns(CampusIvy::Resources::Health) }
    def health
      Resources::Health.new(self)
    end

    sig { returns(CampusIvy::Resources::InstitutionBreaksByShift) }
    def institution_breaks_by_shift
      Resources::InstitutionBreaksByShift.new(self)
    end

    sig { returns(CampusIvy::Resources::NoteType) }
    def note_type
      Resources::NoteType.new(self)
    end

    sig { returns(CampusIvy::Resources::RegisteredStudent) }
    def registered_student
      Resources::RegisteredStudent.new(self)
    end

    sig { returns(CampusIvy::Resources::ServiceType) }
    def service_type
      Resources::ServiceType.new(self)
    end

    sig { returns(CampusIvy::Resources::StudentNote) }
    def student_note
      Resources::StudentNote.new(self)
    end

    sig { returns(CampusIvy::Resources::StudentReference) }
    def student_reference
      Resources::StudentReference.new(self)
    end

    sig { returns(CampusIvy::Resources::UserLoginOption) }
    def user_login_option
      Resources::UserLoginOption.new(self)
    end

    sig { returns(CampusIvy::Resources::UserNotification) }
    def user_notification
      Resources::UserNotification.new(self)
    end

    sig { returns(CampusIvy::Resources::UserProfile) }
    def user_profile
      Resources::UserProfile.new(self)
    end

    sig { returns(CampusIvy::Resources::UserRole) }
    def user_role
      Resources::UserRole.new(self)
    end
  end
end
