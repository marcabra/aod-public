class Agency < ActiveRecord::Base
  has_many :aids
  has_many :projects, through: :aids
  has_many :regions, through: :projects
  
  scope :by_kind, lambda { |kind| where("organism_kind = ?", kind) }
  scope :by_year, lambda { |year| joins(:aids).where("aids.year = ?", year) }
  
  def amount(year)
    @amount ||= aids.by_year(year).sum(&:committed_amount)
  end
  
  def rank(year)
    @rank ||= Agency.joins(:aids).where("year = ?", year).group("agencies.id").having("sum(committed_amount) > ?", amount(year).to_f).all.count + 1
  end
end
