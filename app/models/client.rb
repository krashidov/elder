class Client < ApplicationRecord
  # has_paper_trail
  
  belongs_to :organization
  has_many :careplans, dependent: :destroy
  has_many :providers, through: :careplans

  validates :organization_id, presence: true
  validates_uniqueness_of :medicaid
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :medicaid, presence: true
  validates :ssi, presence: true
  validates :phone_number, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :postal_code, presence: true
  validates :case_manager, presence: true
  validates :manager_phone, presence: true
  validates :date_of_birth, presence: true
  validates :par_expiration, presence: true
  validates :emergency_contact_info, presence: true

  def attributes
    @attributes
  end
end
