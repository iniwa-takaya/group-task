class TaskGroup < ApplicationRecord
  has_many :task_group_users, dependent: :destroy
  has_many :users, through: :task_group_users
  has_many :spaces, dependent: :destroy
  has_many :tasks

  validates :g_name, presence: true
end
