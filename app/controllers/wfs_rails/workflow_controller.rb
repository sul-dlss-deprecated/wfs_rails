module WfsRails
  ##
  # API for handling workflow request
  class WorkflowController < ApplicationController
    include LifecycleConcern

    def lifecycle
      @objects = Workflow.where(
        repository: params[:repo], druid: params[:druid]
      )
      render xml: to_lifecycle
    end
  end
end
