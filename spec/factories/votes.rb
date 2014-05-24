# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vote, :class => 'Votes' do
    model "MyString"
    user_id 1
  end
end
