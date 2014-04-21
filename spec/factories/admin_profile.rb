# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_profile do
    user
    name "Some Admin"
  end
end
