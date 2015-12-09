require 'rails_helper'

RSpec.describe WfsRails::WorkflowParser do
  include XmlFixtures

  let(:druid) { 'druid:aa111bb2222' }
  let(:repository) { 'dor' }
  let(:wf_parser) { described_class.new(workflow_create, druid, repository) }
  describe '#create_workflows' do
    it 'creates a workflow for each process' do
      expect do
        wf_parser.create_workflows
      end.to change(WfsRails::Workflow, :count)
        .by(Nokogiri::XML(workflow_create).xpath('//process').count)
      expect(WfsRails::Workflow.last.druid).to eq druid
      expect(WfsRails::Workflow.last.repository).to eq repository
    end
  end
end
