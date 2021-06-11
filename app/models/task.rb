class Task < ApplicationRecord
  belongs_to :task_group
  belongs_to :space

  validates :content, presence: true 
  validates :status,  inclusion: { in: [true, false] }
end
