class Organization < ApplicationRecord
  # has_paper_trail

  has_many :users,         dependent: :destroy
  has_many :providers,     dependent: :destroy
  has_many :clients,       dependent: :destroy
  has_many :careplans,     dependent: :destroy
  has_many :default_tasks, dependent: :destroy

  validates :name, presence: true
end
