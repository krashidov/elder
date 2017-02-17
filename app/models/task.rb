class Task < ApplicationRecord
  # has_paper_trail
  
  belongs_to :organization
  belongs_to :careplan
  belongs_to :default_task

  validates :organization_id, presence: true
  validates :careplan_id, presence: true
  validates :default_task_id, presence: true
end
