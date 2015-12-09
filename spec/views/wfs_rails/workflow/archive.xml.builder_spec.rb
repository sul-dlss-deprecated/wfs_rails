require 'rails_helper'

RSpec.describe 'wfs_rails/workflow/archive' do
  let(:druid) { 'druid:aa111bb2222' }
  let(:repo) { 'dor' }
  let(:params) { { druid: druid, repo: repo } }
  it 'should render a workflows document' do
    FactoryGirl.create(
      :workflow,
      repository: repo,
      druid: druid,
    )
    @objects = WfsRails::Workflow.all.count

    render template: subject, locals: { params: params }
    doc = Nokogiri::XML.parse(rendered)
    expect(doc.at_xpath('//objects')).to include ['count', /1/]
  end
end
