require 'rails_helper'

RSpec.describe 'wfs_rails/workflow/workflows' do
  let(:druid) { 'druid:aa111bb2222' }
  let(:repo) { 'dor' }
  let(:params) { { druid: druid, repo: repo } }
  it 'should render a workflows document' do
    FactoryGirl.create(:workflow, repository: repo)
    @processes = WfsRails::Workflow.all.group_by(&:datastream)

    render template: subject, locals: { params: params }
    doc = Nokogiri::XML.parse(rendered)
    expect(doc.at_xpath('//workflows')).to include %w(objectId druid:aa111bb2222)
    expect(doc.at_xpath('//workflow')).to include(
      %w(repository dor),
      %w(objectId druid:aa111bb2222),
      %w(id accessionWF)
    )
    expect(doc.at_xpath('//process')).to include(
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
