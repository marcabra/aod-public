class Topic < ActiveRecord::Base
  has_ancestry
  has_many :projects
  
  attr_accessible :code, :name, :ancestry
end
