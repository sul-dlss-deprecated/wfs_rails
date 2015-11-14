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
      xml.milestone(date: updated_at.iso8601, version: version) do
        xml.text lifecycle
      end
    end
  end
end
