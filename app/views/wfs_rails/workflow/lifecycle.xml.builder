xml.lifecycle(objectId: params[:druid]) do
  @objects.each do |workflow|
    workflow.as_milestone(xml)
  end
end
