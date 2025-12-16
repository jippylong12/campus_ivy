# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CampusIvy do
  it 'has a version number' do
    expect(CampusIvy::VERSION).not_to be nil
  end

  describe '.configure' do
    it 'allows setting configuration' do
      CampusIvy.configure do |config|
        config.token = 'test_key'
      end

      expect(CampusIvy.configuration.token).to eq('test_key')
    end
  end
end
