FactoryGirl.define do
  factory :project do
    name "Some project"
    key { Faker::Name.first_name }
    type_id 1
    lead_id 1
    category_id nil
    url { Faker::Internet.url }
  end
end