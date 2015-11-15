module WfsRails
  ##
  # Parsing Workflow creation request
  class WorkflowParser
    attr_reader :xml_request, :druid, :repository

    ##
    # @param [String] request_body
    # @param [String] druid
    # @param [String] repository
    def initialize(request_body, druid, repository)
      @xml_request = Nokogiri::XML(request_body)
      @druid = druid
      @repository = repository
    end

    ##
    # @return [Array]
    def create_workflows
      processes.map do |process|
        Workflow.create(datastream: workflow_id,
                        druid: druid,
                        process: process.name,
                        status: process.status,
                        lane_id: process.lane_id,
                        repository: repository,
                        lifecycle: process.lifecycle
                       )
      end
    end

    private

    def workflow
      xml_request.xpath('//workflow')
    end

    def processes
      workflow.xpath('//process').map do |process|
        ProcessParser.new(process)
      end
    end

    def workflow_id
      workflow.attr('id')
    end
  end
end
