class Organization < ApplicationRecord
  # has_paper_trail

  has_many :users,         dependent: :destroy
  has_many :providers,     dependent: :destroy
  has_many :clients,       dependent: :destroy
  has_many :careplans,     dependent: :destroy
  has_many :task_types,    dependent: :destroy
  has_many :tasks, through: :careplans
  validates :name, presence: true
end
