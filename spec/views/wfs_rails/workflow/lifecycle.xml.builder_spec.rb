require 'rails_helper'

RSpec.describe 'wfs_rails/workflow/lifecycle' do
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
    @objects = WfsRails::Workflow.all

    render template: 'wfs_rails/workflow/lifecycle', locals: { params: params }
    doc = Nokogiri::XML.parse(rendered)
    expect(doc.at_xpath('//lifecycle')).to include %w(objectId druid:abc123)
    expect(doc.at_xpath('//milestone')).to include(
      ['version', /1/],
      ['date', //]
    )
  end
end
