# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CampusIvy::Object do
  let(:data) { { foo: 'bar', nested: { baz: 'qux' }, list: [{ id: 1 }, { id: 2 }] } }
  let(:object) { CampusIvy::Object.new(data) }

  it 'allows access via dot notation' do
    expect(object.foo).to eq('bar')
  end

  it 'wraps nested hashes' do
    expect(object.nested).to be_a(CampusIvy::Object)
    expect(object.nested.baz).to eq('qux')
  end

  it 'wraps objects in arrays' do
    expect(object.list.first).to be_a(CampusIvy::Object)
    expect(object.list.first.id).to eq(1)
  end

  it 'handles missing keys gracefully' do
    expect(object.missing_key).to be_nil
  end
end
