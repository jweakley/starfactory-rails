# == Schema Information
#
# Table name: workshops
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  status      :string(255)
#  banner      :string(255)
#  icon        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :workshop do
    name 'Some Workshop'
    description ''
    status 'Active'
    tracks []
    instructor_profiles []
  end
end
