class TaskGroupUser < ApplicationRecord
  belongs_to :user
  belongs_to :task_group
end
