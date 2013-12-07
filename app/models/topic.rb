class Topic < ActiveRecord::Base
  has_ancestry
  has_many :projects
  has_many :aids, through: :projects
  
  scope :by_year, lambda { |year| joins(:aids).where("aids.year = ?", year) }
  
  def amount(year)
    @amount ||= aids.by_year(year).sum(&:committed_amount)
  end
  
  def rank(year)
    @rank ||= Topic.joins(:aids).where("year = ?", year).group("topics.id").having("sum(committed_amount) > ?", amount(year).to_f).all.count + 1
  end
end
