# frozen_string_literal: true

module WfsRails
  ##
  # API for handling workflow request. Implemented as an isolated Rails::Engine
  # controller, WfsRails::ApplicationController by default doesn't inherit from
  # a consuming application's `ApplicationController`
  class WorkflowController < WfsRails::ApplicationController
    def lifecycle
      @objects = Workflow.where(
        repository: params[:repo], druid: params[:druid]
      )
    end

    def index
      @processes = Workflow.where(
        repository: params[:repo], druid: params[:druid]
      ).order(:datastream, created_at: :asc).group_by(&:datastream)
    end

    def show
      @processes = Workflow.where(
        repository: params[:repo],
        druid: params[:druid],
        datastream: params[:workflow]
      ).order(:datastream, created_at: :asc).group_by(&:datastream)
      render :index
    end

    def update
      @process = Workflow.find_by!(
        repository: params[:repo],
        druid: params[:druid],
        datastream: params[:workflow],
        process: params[:process]
      )

      if params['current-status'].present?
        @process.update(status: params['current-status'])
      else
        @process.update(status: 'completed')
      end
      head :no_content
   end

    def destroy
      @processes = Workflow.where(
        repository: params[:repo],
        druid: params[:druid],
        datastream: params[:workflow]
      ).destroy_all
      head :no_content
    end

    def archive
      @objects = Workflow.where(
        repository: params[:repository],
        datastream: params[:workflow]
      ).count
    end

    def create
      @workflows = WfsRails::WorkflowParser.new(
        request.body.read, params[:druid], params[:repo]
      ).create_workflows
    end
  end
end
