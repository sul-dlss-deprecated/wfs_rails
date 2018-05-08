require 'rails_helper'

RSpec.describe WfsRails::Workflow do
  subject do
    described_class.create(
      druid: 'druid:aa111bb2222',
      datastream: 'accessionWF',
      process: 'start-accession',
      lifecycle: 'submitted',
      status: 'skipped'
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
  describe '#as_milestone' do
    builder = {}
    before do
      builder = Nokogiri::XML::Builder.new do |xml|
        subject.as_milestone(xml)
      end
    end
    let(:parsed_xml) { Nokogiri::XML(builder.to_xml) }
    it 'serializes a Workflow as a milestone' do
      expect(parsed_xml.at_xpath('//milestone'))
        .to include ['date', //], ['version', /1/]
      expect(parsed_xml.at_xpath('//milestone').content).to eq 'submitted'
    end
  end
  describe '#as_process' do
    builder = {}
    before do
      builder = Nokogiri::XML::Builder.new do |xml|
        subject.as_process(xml)
      end
    end
    let(:parsed_xml) { Nokogiri::XML(builder.to_xml) }
    it 'serializes a Workflow as a process' do
      expect(parsed_xml.at_xpath('//process'))
        .to include(
          ['version', /1/],
          ['priority', /0/],
          ['note', ''],
          %w(lifecycle submitted),
          %w(laneId default),
          ['elapsed', ''],
          ['attempts', /0/],
          ['datetime', //],
          %w(status skipped),
          %w(name start-accession)
        )
    end
  end
end
