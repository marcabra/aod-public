class Region < ActiveRecord::Base
  has_many :incomes
  has_many :projects
  has_many :aids, through: :projects

  scope :by_year, lambda { |year| joins(:aids).where("aids.year = ?", year) }

  def amount(year, via = nil)
    if via.nil?
      @amount ||= aids.by_year(year).sum(:committed_amount)
    else
      aids.by_year(year).by_via(via).sum(:committed_amount)
    end
  end
  
  def grand_total
    aids.sum(:committed_amount)
  end
  
  def rank(year)
    @rank ||= Region.joins(:aids).where("year = ?", year).group("regions.id").having("sum(committed_amount) > ?", amount(year).to_f).all.count + 1
  end
  
  def reimbursement_amount(year)
    @reimbursement_amount ||= aids.by_year(year).where("paid_amount < 0").sum(&:paid_amount).abs
  end
  
  def self.by_agency(agency, year)
    find_by_sql([%Q(select regions.*, sum(aids.committed_amount) as committed_amount
      from regions
      inner join projects on regions.id = projects.region_id
      inner join aids on projects.id=aids.project_id
      where aids.agency_id=?
      and aids.year=? 
      group by regions.id
      order by committed_amount 
      desc limit 5), agency, year])
  end

  def self.by_topic(topic, year)
    find_by_sql([%Q(select regions.*, sum(aids.committed_amount) as committed_amount
      from regions
      inner join projects on regions.id = projects.region_id
      inner join aids on projects.id=aids.project_id
      where projects.topic_id=?
      and aids.year=? 
      group by regions.id
      order by committed_amount 
      desc limit 5), topic, year])
  end
end
