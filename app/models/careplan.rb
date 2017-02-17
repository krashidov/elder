class Careplan < ApplicationRecord
  # has_paper_trail
  
  has_many :tasks, dependent: :destroy

  belongs_to :organization
  belongs_to :client
  belongs_to :provider

  validates :organization_id, presence: true
  validates :client_id, presence: true
  validates :provider_id, presence: true
  validates :start_date, presence: true
  validates :procedure_code, presence: true
end
