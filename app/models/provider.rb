class Provider < ApplicationRecord
# == Schema Information
#
# Table name: providers
#
#  id                            :integer          not null, primary key
#  created_at                    :datetime
#  updated_at                    :datetime
#  last_name                     :string(255)
#  first_name                    :string(255)
#  ssi                           :string(255)
#  phone_number                  :string(255)
#  address                       :string(255)
#  city                          :string(255)
#  state                         :string(255)
#  postal_code                   :string(255)
#  hours_plus_travel             :string(255)
#  date_of_birth                 :date
#  emergency_contact_info        :string(255)
#  units                         :integer          default(0)
#  staff_evaluation_date         :date
#  safety_training_date          :date
#  supervisor                    :string(255)
#  language                      :string(255)
#  id_expiration_date            :date
#  work_authorization_expiration :date
#  active                        :boolean          default(TRUE)
#  organization_id               :integer
#
# Indexes
#
#  index_providers_on_organization_id  (organization_id)
#

  # has_paper_trail
 
  belongs_to :organization
  has_many :careplans, dependent: :destroy
  has_many :clients, through: :careplans

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :ssi, presence: true
  validates :phone_number, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :postal_code, presence: true
  validates :emergency_contact_info, presence: true
  validates :staff_evaluation_date, presence: true
  validates :safety_training_date, presence: true
  validates :id_expiration_date, presence: true
  validates :work_authorization_expiration, presence: true
  validates :active, presence: true
  validates :organization, presence: true

  def allowed_attributes
    @attributes
  end
end
