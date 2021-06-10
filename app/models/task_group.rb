class TaskGroup < ApplicationRecord
  has_many :task_group_users
  has_many :users, through: :task_group_users

  validates :g_name, presence: true
end
