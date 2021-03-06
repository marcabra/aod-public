class Topic < ActiveRecord::Base
  has_ancestry cache_depth:true
  has_many :projects
  has_many :aids, through: :projects
  
  scope :by_year, lambda { |year| joins(:aids).where("aids.year = ?", year) }
  
  def amount(year)
    if self.has_children?
      @amount ||= children.sum { |c| c.amount(year) }
    else
      @amount ||= aids.by_year(year).sum(:paid_amount)
    end
  end
    
  def rank(year)
    @rank ||= Topic.joins(:aids).where("year = ?", year).group("topics.id").having("sum(aids.paid_amount) > ?", amount(year).to_f).all.count + 1
  end
  
  def self.by_region(region, year)
    find_by_sql([%Q(select topics.*, sum(aids.paid_amount) as paid_amount
      from topics 
      inner join projects on topics.id=projects.topic_id 
      inner join aids on projects.id=aids.project_id 
      where projects.region_id=? 
      and aids.year=? 
      group by topics.id
      order by paid_amount desc 
      limit 5), region, year])
  end
  
  def self.by_agency(agency, year)
    find_by_sql([%Q(select topics.*, sum(aids.paid_amount) as paid_amount
      from topics
      inner join projects on topics.id = projects.topic_id
      inner join aids on projects.id=aids.project_id
      where aids.agency_id=?
      and aids.year=? 
      group by topics.id
      order by paid_amount desc 
      limit 5), agency, year])
  end
  
end
