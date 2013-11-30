class Region < ActiveRecord::Base
  has_many :incomes
  has_many :projects
  attr_accessible :area, :name
end
