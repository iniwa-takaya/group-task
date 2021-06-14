FactoryBot.define do
  factory :task do
    content { 'abc' }
    status {Faker::Boolean.boolean}
    deadline { Date.tomorrow }
    association :task_group
    association :space
  end
end
