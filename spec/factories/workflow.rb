FactoryGirl.define do
  factory :workflow, class: WfsRails::Workflow do
    druid 'druid:abc123'
    datastream 'ds'
    process 'proc'
  end
end
