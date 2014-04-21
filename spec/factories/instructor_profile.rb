# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :instructor_profile do
    user
    name 'Some Instructor'
  end
end
