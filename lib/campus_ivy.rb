# frozen_string_literal: true

require_relative 'campus_ivy/version'
require 'sorbet-runtime'
require_relative 'campus_ivy/configuration'
require_relative 'campus_ivy/object'
require_relative 'campus_ivy/resources/account'
require_relative 'campus_ivy/resources/attendance'
require_relative 'campus_ivy/resources/award_and_disbursement_transmission'
require_relative 'campus_ivy/resources/disbursement_batch_detail'
require_relative 'campus_ivy/resources/packaging'
require_relative 'campus_ivy/resources/student_awards'
require_relative 'campus_ivy/resources/student_award_transmission_log'
require_relative 'campus_ivy/resources/student_disbursement_transmission_log'
require_relative 'campus_ivy/resources/cod_log'
require_relative 'campus_ivy/resources/cod_response_ec'
require_relative 'campus_ivy/resources/cod_response_pn'
require_relative 'campus_ivy/resources/cod_response_sp'
require_relative 'campus_ivy/resources/student_isir'
require_relative 'campus_ivy/resources/student_selected_isir'
require_relative 'campus_ivy/resources/student_r2t4'
require_relative 'campus_ivy/resources/net_price_calculator'
require_relative 'campus_ivy/resources/pay_list_analysis'
require_relative 'campus_ivy/resources/student_fa_progression'
require_relative 'campus_ivy/resources/student_funding_detail'
require_relative 'campus_ivy/resources/student_funding_estimate'
require_relative 'campus_ivy/resources/student_remaining_balance'
require_relative 'campus_ivy/resources/document_analysis'
require_relative 'campus_ivy/resources/document_inventory'
require_relative 'campus_ivy/resources/document_status'
require_relative 'campus_ivy/resources/student_document'
require_relative 'campus_ivy/resources/student_document_history'
require_relative 'campus_ivy/resources/student_document_tags'
require_relative 'campus_ivy/resources/functional_area_task'
require_relative 'campus_ivy/resources/health'
require_relative 'campus_ivy/resources/institution_breaks_by_shift'
require_relative 'campus_ivy/resources/note_type'
require_relative 'campus_ivy/resources/registered_student'
require_relative 'campus_ivy/resources/service_type'
require_relative 'campus_ivy/resources/student_note'
require_relative 'campus_ivy/resources/student_reference'
require_relative 'campus_ivy/resources/user_login_option'
require_relative 'campus_ivy/resources/user_notification'
require_relative 'campus_ivy/resources/user_profile'
require_relative 'campus_ivy/resources/user_role'
require_relative 'campus_ivy/client'

module CampusIvy
  class Error < StandardError; end
  class RateLimitError < Error; end

  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end
end
