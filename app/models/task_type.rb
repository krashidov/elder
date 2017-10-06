class TaskType < ApplicationRecord
    # resourcify
  # has_paper_trail
  
  belongs_to :organization
  has_many   :tasks, dependent: :destroy

  validates :organization_id, presence: true
  validates :name, presence: true, length: {maximum: 100}
  validates_inclusion_of :homemaking, :in => [true, false]
  validates :value, presence: true, numericality: { only_integer: true, 
                                                    less_than_or_equal_to: 1440 }
end
