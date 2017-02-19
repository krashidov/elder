class Task < ApplicationRecord
  # has_paper_trail
  belongs_to :careplan
  belongs_to :organization
  belongs_to :task_type

  validates :organization_id, presence: true
  validates :careplan_id, presence: true
  validates :task_type_id, presence: true
end
