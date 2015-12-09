module WfsRails
  ##
  # API for handling workflow request. Implemented as an isolated Rails::Engine
  # controller, WfsRails::ApplicationController by default doesn't inherit from
  # a consuming application's `ApplicationController`
  class WorkflowController < WfsRails::ApplicationController
    
    ##
    # Returns the set of milestones that this object has achieved
    #
    # @return [Array<Workflow>] and sets `@objects`
    def lifecycle
      @objects = Workflow.where(
        repository: params[:repo], druid: params[:druid], status: %w(completed skipped)
      )
    end

    # @return [Array<Workflow>] and sets `@processes`
    def workflows
      @processes = Workflow.where(
        repository: params[:repo], druid: params[:druid]
      ).order(:datastream, created_at: :asc).group_by(&:datastream)
    end

    # @return [Array<Workflow>] and sets `@processes`
    def workflows_by_datastream
      @processes = Workflow.where(
        repository: params[:repo],
        druid: params[:druid],
        datastream: params[:workflow]
      ).order(:datastream, created_at: :asc).group_by(&:datastream)
      render :workflows
    end

    # @return [Array<Workflow>] and sets `@objects`
    def archive
      @objects = Workflow.where(
        repository: params[:repository],
        datastream: params[:workflow]
      ).count
    end

    # @return [Array<Workflow>] and sets `@workflows`
    def create
      @workflows = WfsRails::WorkflowParser.new(
        request.body.read, params[:druid], params[:repo]
      ).create_workflows
    end
  end
end
