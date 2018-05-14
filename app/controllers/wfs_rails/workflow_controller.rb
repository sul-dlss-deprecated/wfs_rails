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
      render :workflows
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
