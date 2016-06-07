FactoryGirl.define do
  factory :project_type do
    name { Faker::Name.first_name }
  end
end