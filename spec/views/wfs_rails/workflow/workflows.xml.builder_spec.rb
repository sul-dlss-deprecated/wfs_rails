require 'rails_helper'

RSpec.describe 'wfs_rails/workflow/workflows' do
  let(:druid) { 'druid:abc123' }
  let(:repo) { 'dor' }
  let(:params) { { druid: druid, repo: repo } }
  it 'should render a workflows document' do
    FactoryGirl.create(
      :workflow,
      repository: repo,
      druid: druid,
      datastream: 'accessionWF'
    )
    @processes = WfsRails::Workflow.all.group_by(&:datastream)

    render template: 'wfs_rails/workflow/workflows', locals: { params: params }
    doc = Nokogiri::XML.parse(rendered)
    expect(doc.at_xpath('//workflows')).to include %w(objectId druid:abc123)
    expect(doc.at_xpath('//workflow')).to include(
      %w(repository dor),
      %w(objectId druid:abc123),
      %w(id accessionWF)
    )
    expect(doc.at_xpath('//process')).to include(
      ['version', /1/],
      ['priority', /0/],
      ['note', ''],
      ['lifecycle', ''],
      %w(laneId default),
      ['elapsed', ''],
      ['attempts', /0/],
      ['datetime', //],
      ['status', ''],
      %w(name proc)
    )
  end
end
