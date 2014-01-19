class Agency < ActiveRecord::Base
  has_many :aids
  has_many :projects, through: :aids
  has_many :regions, through: :projects
  
  scope :by_kind, lambda { |kind| where("organism_kind = ?", kind) }
  scope :by_organism, lambda { |organism| where("organism = ?", organism) }
  scope :by_year, lambda { |year| joins(:aids).where("aids.year = ?", year) }
  
  def amount(year)
    @amount ||= aids.by_year(year).sum(:paid_amount)
  end
  
  def rank(year)
    @rank ||= Agency.joins(:aids).where("year = ?", year).group("agencies.id").having("sum(aids.paid_amount) > ?", amount(year).to_f).all.count + 1
  end
  
  def self.by_region(region, year)
    find_by_sql([%Q(select agencies.*, sum(aids.paid_amount) as paid_amount
      from projects
      inner join aids on projects.id=aids.project_id
      inner join agencies on aids.agency_id=agencies.id
      where projects.region_id = ?
      and aids.year=?
      group by agencies.id
      order by paid_amount desc
      limit 5), region, year])
  end  

  def self.by_topic(topic, year)
    find_by_sql([%Q(select agencies.*, sum(aids.paid_amount) as paid_amount
      from projects
      inner join aids on projects.id=aids.project_id
      inner join agencies on aids.agency_id=agencies.id
      where projects.topic_id = ?
      and aids.year=?
      group by agencies.id
      order by paid_amount desc 
      limit 5), topic, year])
  end 
  
  def self.count(year)
    @count ||= Agency.joins(:aids).where("year = ?", year).select("distinct agencies.id").count
  end
end
