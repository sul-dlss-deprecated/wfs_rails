module WfsRails
  ##
  # Providing lifecycle serialization for workflow objects
  module LifecycleConcern
    extend ActiveSupport::Concern

    ##
    # Formats a lifecycle request
    # @return [String]
    def to_lifecycle
      Nokogiri::XML::Builder.new do |xml|
        xml.lifecycle(objectId: params[:druid]) do
          @objects.each do |workflow|
            workflow.as_milestone(xml)
          end
        end
      end.to_xml
    end
  end
end
