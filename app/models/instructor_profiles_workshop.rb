# == Schema Information
#
# Table name: instructor_profiles_workshops
#
#  id                    :integer          not null, primary key
#  instructor_profile_id :integer
#  workshop_id           :integer
#  created_at            :datetime
#  updated_at            :datetime
#

class InstructorProfilesWorkshop < ActiveRecord::Base
  belongs_to :instructor_profile
  belongs_to :workshop
end
