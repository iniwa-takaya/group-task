class Space < ApplicationRecord
  belongs_to :task_group

  validates :s_name, presence: true
end
