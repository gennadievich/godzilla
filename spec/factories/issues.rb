FactoryGirl.define do
  factory :issue do
    summary { Faker::Name.name }
    description { Faker::Lorem.sentence }
    estimate_time 8
    reporter_id 1
    status_id 1
    priority_id 1
    type_id 1
    sprint_id 1
  end
end