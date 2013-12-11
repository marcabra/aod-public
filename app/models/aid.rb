class Aid < ActiveRecord::Base
  belongs_to :project
  belongs_to :agency

  scope :by_year, lambda { |year| where("year = ?", year) }
  scope :by_via, lambda { |via| joins(:project).where("projects.aid_via = ?", via) }
end
