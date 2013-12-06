class Region < ActiveRecord::Base
  has_many :incomes
  has_many :projects
  has_many :aids, through: :projects

  attr_accessible :area, :name
  
  scope :by_year, lambda { |year| joins(:aids).where("aids.year = ?", year) }

  def amount(year, kind = nil)
    if kind.nil?
      @amount ||= aids.by_year(year).sum(&:committed_amount)
    else 
      aids.by_year(year).by_kind(kind).sum(&:committed_amount)
    end
  end
  
  def reimbursement_amount(year)
    @reimbursement_amount ||= aids.by_year(year).where("paid_amount < 0").sum(&:paid_amount).abs
  end
  
  def grand_total
    aids.sum(&:committed_amount)
  end
  
  def rank(year)
    @rank ||= Region.joins(:aids).where("year = ?", year).group("regions.id").having("sum(committed_amount) > ?", amount(year).to_f).all.count + 1
  end
end
