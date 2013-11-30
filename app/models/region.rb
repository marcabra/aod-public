class Region < ActiveRecord::Base
  has_many :incomes
  attr_accessible :area, :name
end
