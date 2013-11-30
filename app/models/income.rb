class Income < ActiveRecord::Base
  belongs_to :region
  attr_accessible :code, :name, :year
end
