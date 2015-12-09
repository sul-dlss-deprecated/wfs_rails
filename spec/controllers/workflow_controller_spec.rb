require 'rails_helper'

RSpec.describe WfsRails::WorkflowController do
  include XmlFixtures
  routes { WfsRails::Engine.routes }
  describe 'GET lifecycle' do
    it 'loads ActiveRecord Relation and parses it to valid XML' do
      wf = FactoryGirl.create(:workflow, repository: 'dor')
      get :lifecycle, repo: wf.repository, druid: wf.druid, format: :xml
      expect(assigns(:objects)).to be_an ActiveRecord::Relation
      expect(assigns(:objects).count).to eq 1
      expect(response).to render_template 'lifecycle'
    end
  end
  describe 'GET workflows' do
    it 'loads and groups ActiveRecord Relation renders workflows' do
      wf = FactoryGirl.create(:workflow, repository: 'dor')
      get :workflows, repo: wf.repository, druid: wf.druid, format: :xml
      expect(assigns(:processes)).to be_an Hash
      expect(assigns(:processes).length).to eq 1
      expect(response).to render_template 'workflows'
    end
  end
  describe 'GET archive' do
    it 'loads count of workflows' do
      wf = FactoryGirl.create(:workflow, repository: 'dor')
      get :archive, repository: wf.repository, workflow: wf.datastream, format: :xml
      expect(assigns(:objects)).to eq 1
      expect(response).to render_template 'archive'
    end
  end
  describe 'PUT create' do
    let(:druid) { 'druid:aa111bb2222' }
    let(:workflow) { 'accessionWF' }
    let(:repository) { 'dor' }
    let(:request_data) { workflow_create }
    it 'creates new workflows' do
      expect do
        put :create, request_data, repo: repository, druid: druid, workflow: workflow, format: :xml
      end.to change(WfsRails::Workflow, :count)
        .by(Nokogiri::XML(workflow_create).xpath('//process').count)
    end
  end
end
