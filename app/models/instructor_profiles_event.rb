# == Schema Information
#
# Table name: instructor_profiles_events
#
#  id                    :integer          not null, primary key
#  instructor_profile_id :integer
#  event_id              :integer
#  created_at            :datetime
#  updated_at            :datetime
#

class InstructorProfilesEvent < ActiveRecord::Base
  belongs_to :instructor_profile
  belongs_to :event
end
