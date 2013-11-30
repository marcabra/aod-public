class Topic < ActiveRecord::Base
  has_many :projects
  attr_accessible :code, :name, :parent_id
end
