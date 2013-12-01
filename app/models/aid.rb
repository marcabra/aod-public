class Aid < ActiveRecord::Base
  belongs_to :project
  belongs_to :agency

  attr_accessible :committed_amount, :paid_amount, :year, :agency

  scope :by_year, lambda { |year| where("year = ?", year) }
  scope :group_by_year, group("year").select("year, sum(aids.committed_amount) as amount").order("amount desc")  
end
