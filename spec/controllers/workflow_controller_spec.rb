require 'rails_helper'

RSpec.describe WfsRails::WorkflowController do
  include XmlFixtures
  routes { WfsRails::Engine.routes }
  let(:repository) { 'dor' }

  describe 'GET lifecycle' do
    it 'loads ActiveRecord Relation and parses it to valid XML' do
      wf = FactoryGirl.create(:workflow)
      get :lifecycle, params: { repo: wf.repository, druid: wf.druid, format: :xml }
      expect(assigns(:objects)).to be_an ActiveRecord::Relation
      expect(assigns(:objects).count).to eq 1
      expect(response).to render_template 'lifecycle'
    end
  end
  describe 'GET index' do
    it 'loads and groups ActiveRecord Relation renders workflows' do
      wf = FactoryGirl.create(:workflow)
      get :index, params: { repo: wf.repository, druid: wf.druid, format: :xml }
      expect(assigns(:processes)).to be_an Hash
      expect(assigns(:processes).length).to eq 1
      expect(response).to render_template 'index'
    end
  end

  describe 'GET show' do
    it 'loads and groups ActiveRecord Relation renders workflows' do
      wf = FactoryGirl.create(:workflow)
      get :show, params: { repo: wf.repository, druid: wf.druid, workflow: wf.datastream, format: :xml }
      expect(assigns(:processes)).to be_an Hash
      expect(assigns(:processes).length).to eq 1
      expect(response).to render_template 'index'
    end
  end

  describe 'GET archive' do
    it 'loads count of workflows' do
      wf = FactoryGirl.create(:workflow)
      get :archive, params: { repository: wf.repository, workflow: wf.datastream, format: :xml }
      expect(assigns(:objects)).to eq 1
      expect(response).to render_template 'archive'
    end
  end

  describe 'DELETE destroy' do
    let!(:wf) { FactoryGirl.create(:workflow) }

    it 'deletes workflows' do
      delete :destroy, params: { repo: wf.repository, druid: wf.druid, workflow: wf.datastream, format: :xml }
      expect(response).to be_no_content
    end
  end

  describe 'PUT create' do
    let(:druid) { 'druid:abc123' }
    let(:workflow) { 'accessionWF' }
    let(:repository) { 'dor' }
    let(:request_data) { workflow_create }
    it 'creates new workflows' do
      expect do
        put :create, body: request_data, params: { repo: repository, druid: druid, workflow: workflow, format: :xml }
      end.to change(WfsRails::Workflow, :count)
        .by(Nokogiri::XML(workflow_create).xpath('//process').count)
    end
  end
end
