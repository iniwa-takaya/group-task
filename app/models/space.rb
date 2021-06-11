class Space < ApplicationRecord
  belongs_to :task_group
  has_many :tasks

  validates :s_name, presence: true
end
