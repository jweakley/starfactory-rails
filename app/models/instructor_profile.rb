# == Schema Information
#
# Table name: instructor_profiles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  bio        :text
#  avatar     :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class InstructorProfile < ActiveRecord::Base
  belongs_to :user, inverse_of: :instructor_profile
  has_many :instructor_profiles_events
  has_many :events, through: :instructor_profiles_events

  delegate :email, to: :user, allow_nil: true

  accepts_nested_attributes_for :user

  scope :by_name, order(name: :asc)

  validates :name, presence: true
  validates :user, presence: true
end
