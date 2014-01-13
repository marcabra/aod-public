class Project < ActiveRecord::Base
  belongs_to :region
  belongs_to :topic
  has_many :aids
  has_many :agencies, through: :aids
    
  scope :by_year, lambda { |year| joins(:aids).where("aids.year = ?", year) }
  scope :group_by_regions, joins([:region, :aids]).group("regions.id").select("regions.id, regions.name, sum(aids.paid_amount) as amount").order("amount desc")
  scope :group_by_topics, joins([:topic, :aids]).group("topics.id").select("topics.id, topics.name, sum(aids.paid_amount) as amount").order("amount desc")
  scope :group_by_agencies, joins([:agencies, :aids]).group("agencies.id").select("agencies.id, agencies.name, sum(aids.paid_amount) as amount").order("amount desc")
  
  def committed_amount
    @committed_amount ||= aids.sum(:committed_amount)
  end
  
  def paid_amount
    @paid_amount ||= aids.sum(:paid_amount)
  end
  
  def returned_amount
    @returned_amount ||= aids.sum(:returned_amount)
  end
end
