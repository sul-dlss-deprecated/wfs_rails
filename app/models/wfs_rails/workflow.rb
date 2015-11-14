module WfsRails
  class Workflow < ActiveRecord::Base
    validates :druid, presence: true
    validates :datastream, presence: true
    validates :process, presence: true

    ##
    # Serialize a WfsRails::Workflow as a milestone
    # @param [Nokogiri::XML::Builder] xml
    # @return [Nokogiri::XML::Builder::NodeBuilder]
    def as_milestone(xml)
      xml.milestone(date: updated_at.to_time.iso8601, version: version) do
        xml.text lifecycle
      end
    end

    ##
    # Serialize as WfsRails::Workflow as a process
    # @param [Nokogiri::XML::Builder] xml
    # @return [Nokogiri::XML::Builder::NodeBuilder]
    def as_process(xml)
      xml.process(version: version,
                  priority: priority,
                  note: note,
                  lifecycle: lifecycle,
                  laneId: lane_id,
                  elapsed: elapsed,
                  attempts: attempts,
                  datetime: created_at.to_time.iso8601,
                  status: status,
                  name: process)
    end
  end
end
