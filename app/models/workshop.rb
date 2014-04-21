# == Schema Information
#
# Table name: workshops
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  description           :text
#  status                :string(255)
#  banner                :string(255)
#  icon                  :string(255)
#  track_id              :integer
#  instructor_profile_id :integer
#  created_at            :datetime
#  updated_at            :datetime
#

class Workshop < ActiveRecord::Base
end
