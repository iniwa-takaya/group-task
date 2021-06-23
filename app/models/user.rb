class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]


  with_options presence: true do
    validates :nick_name, uniqueness: { case_sensitive: false }
    validates :group_number, format: { with: /\A\d{8}\z/, message: 'は８桁の半角数字しか登録できません' }
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }, on: :create

  has_many :task_group_users
  has_many :task_groups, through: :task_group_users
  has_one_attached :image
  has_many :sns_credentials

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nick_name: auth.info.name,
        email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = "a12345"
      user.nick_name = "guest"
      user.group_number = "00000000"
    end
  end
  
end
