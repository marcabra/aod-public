class Aid < ActiveRecord::Base
  belongs_to :project
  belongs_to :agency

  attr_accessible :committed_amount, :paid_amount, :year, :agency
end
