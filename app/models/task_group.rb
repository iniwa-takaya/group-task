class TaskGroup < ApplicationRecord
  has_many :task_group_users, dependent: :destroy
  has_many :users, through: :task_group_users, validate: false
  has_many :spaces, dependent: :destroy
  has_many :tasks, dependent: :destroy

  validates :g_name, presence: true
end
