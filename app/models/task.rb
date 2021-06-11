class Task < ApplicationRecord
  belongs_to :task_group
  belongs_to :space
end
