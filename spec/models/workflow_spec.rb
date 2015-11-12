require 'rails_helper'

RSpec.describe WfsRails::Workflow do
  subject do
    described_class.create(
      druid: 'druid:abc123',
      datastream: 'accessionWF',
      process: 'start-accession'
    )
  end
  context 'with required values' do
    it 'is valid' do
      expect(subject.valid?).to be true
    end
  end
  context 'without required values' do
    subject { described_class.create }
    it 'is not valid' do
      expect(subject.valid?).to be false
    end
  end
end
