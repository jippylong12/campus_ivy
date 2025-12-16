# frozen_string_literal: true

require 'spec_helper'
require 'campus_ivy'

RSpec.describe CampusIvy::Configuration do
  let(:config) { described_class.new }

  before do
    # Ensure clean state for each test
    stub_const('ENV', ENV.to_hash.dup)
    ENV.delete('CAMPUS_IVY_USE_SANDBOX')
  end

  describe '#initialize' do
    context 'without environment variable' do
      it 'defaults sandbox to false' do
        expect(config.sandbox).to be false
      end

      it 'uses production URL by default' do
        expect(config.base_url).to eq('https://api.campusivy.com/v1')
      end
    end

    context 'with CAMPUS_IVY_USE_SANDBOX=true' do
      before do
        ENV['CAMPUS_IVY_USE_SANDBOX'] = 'true'
      end

      it 'sets sandbox to true' do
        expect(config.sandbox).to be true
      end

      it 'uses sandbox URL' do
        expect(config.base_url).to eq('https://apisandbox.campusivy.com/Apis/CampusIvy.API/api')
      end
    end
  end

  describe '#sandbox=' do
    it 'updates base_url when switched to true' do
      config.sandbox = true
      expect(config.base_url).to eq('https://apisandbox.campusivy.com/Apis/CampusIvy.API/api')
    end

    it 'updates base_url when switched to false' do
      # Set to true first
      config.sandbox = true
      # Then back to false
      config.sandbox = false
      expect(config.base_url).to eq('https://api.campusivy.com/v1')
    end
  end
end
