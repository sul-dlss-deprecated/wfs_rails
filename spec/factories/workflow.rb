FactoryGirl.define do
  factory :workflow, class: WfsRails::Workflow do
    druid 'druid:aa111bb2222'
    datastream 'accessionWF'
    process 'start-accession'
    lifecycle 'submitted'
    status 'skipped'
  end
end
