# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :student_profile do
    user
    name 'Some Student'
  end
end
