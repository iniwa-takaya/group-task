FactoryBot.define do
  factory :space do
    s_name { 'abc' }
    s_description { 'abc' }
    association :task_group
  end
end
