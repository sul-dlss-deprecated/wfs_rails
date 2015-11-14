require 'rails_helper'

RSpec.describe WfsRails::WorkflowController do
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
end
