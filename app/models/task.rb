class Task < ApplicationRecord
  belongs_to :task_group
  belongs_to :space

  validates :content, presence: true
  validates :status,  inclusion: { in: [true, false] }
  validate :check_day

  def check_day
    errors.add(:deadline, 'を過去の日時で設定することはできません') if !deadline.nil? && (deadline < Time.now)
  end
end
