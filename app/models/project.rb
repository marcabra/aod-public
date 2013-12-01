class Project < ActiveRecord::Base
  extend Enumerize
  
  belongs_to :region
  belongs_to :topic
  has_many :aids
  
  attr_accessible :aid_kind, :aid_via, :beneficiaries_count, :beneficiaries_kind, :beneficiaries_women, :description, :duration, :ended_at, :internal_code, :intervention_number, :location, :meta_odm, :odm, :result, :started_at, :title, :region, :topic
  
  #enumerize :aid_kind, in: [:debt, :credit, :grant]
  #enumerize :aid_via, in: [:bilateral, :multilateral, :multibilateral]
  
  scope :by_year, lambda { |year| joins(:aids).where("aids.year = ?", year) }
  scope :group_by_regions, joins(:region).group("regions.id").select("regions.id, regions.name, sum(aids.committed_amount) as amount").order("amount desc")
  scope :group_by_topics, joins(:topic).group("topics.id").select("topics.id, topics.name, sum(aids.committed_amount) as amount").order("amount desc")
end
