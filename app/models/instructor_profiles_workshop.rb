class InstructorProfilesWorkshop < ActiveRecord::Base
  belongs_to :instructor_profile
  belongs_to :workshop
end
