FactoryBot.define do
  factory :user do
    nick_name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password { 'a12345' }
    password_confirmation {password}

    after(:build) do |user|
      user.image.attach(io: File.open('public/images/no-image.jpg'), filename: 'no-image.jpg')
    end
  end
end
