class Project < ActiveRecord::Base
  belongs_to :region
  belongs_to :topic
  has_many :aids
  has_many :agencies, through: :aids
    
  scope :by_year, lambda { |year| joins(:aids).where("aids.year = ?", year) }
  scope :group_by_regions, joins([:region, :aids]).group("regions.id").select("regions.id, regions.name, sum(aids.committed_amount) as amount").order("amount desc")
  scope :group_by_topics, joins([:topic, :aids]).group("topics.id").select("topics.id, topics.name, sum(aids.committed_amount) as amount").order("amount desc")
  scope :group_by_agencies, joins([:agencies, :aids]).group("agencies.id").select("agencies.id, agencies.name, sum(aids.committed_amount) as amount").order("amount desc")
  scope :order_by_amount, joins(:aids).order("aids.committed_amount desc")
  
  def committed_amount
    @committed_amount ||= aids.sum(:committed_amount)
  end
end
