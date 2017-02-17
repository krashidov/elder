class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # rolify
  # has_paper_trail

  belongs_to :organization

  validates :organization_id, presence: true, numericality: { only_integer: true }
  validate :validate_organization_id

private 
  def validate_organization_id
     errors.add(:organization_id, "is invalid") unless Organization.exists?(self.organization_id)
  end
end
