class Project < ActiveRecord::Base
  extend Enumerize
  
  belongs_to :region
  belongs_to :topic
  has_many :aids
  
  attr_accessible :aid_kind, :aid_via, :beneficiaries_count, :beneficiaries_kind, :beneficiaries_women, :description, :duration, :ended_at, :internal_code, :intervention_number, :location, :meta_odm, :odm, :result, :started_at, :title
  
  enumerize :aid_kind, in: [:debt, :credit, :grant]
  enumerize :aid_via, in: [:bilateral, :multilateral, :multibilateral]
end
