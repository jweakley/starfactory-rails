# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    starts_at Time.now + 2.days + 4.hours
    ends_at Time.now + 2.days + 6.hours
    workshop
    instructor_profiles []
  end
end
