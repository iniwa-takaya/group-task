class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nick_name, uniqueness: true
  end

  has_many :task_group_users
  has_many :task_groups, through: :task_group_users
  has_one_attached :image
end
