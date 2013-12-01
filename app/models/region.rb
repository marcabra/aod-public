class Region < ActiveRecord::Base
  has_many :incomes
  has_many :projects
  has_many :aids, through: :projects

  attr_accessible :area, :name
  
  scope :by_year, lambda { |year| joins(:aids).where("aids.year = ?", year) }
end
