class Agency < ActiveRecord::Base
  has_many :aids
  
  attr_accessible :name, :organism, :organism_kind
end
