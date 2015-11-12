module WfsRails
  class Workflow < ActiveRecord::Base
    validates :druid, presence: true
    validates :datastream, presence: true
    validates :process, presence: true
  end
end
