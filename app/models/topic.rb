class Topic < ActiveRecord::Base
  attr_accessible :code, :name, :parent_id
end
