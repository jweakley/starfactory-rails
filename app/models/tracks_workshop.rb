# == Schema Information
#
# Table name: tracks_workshops
#
#  id          :integer          not null, primary key
#  track_id    :integer
#  workshop_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class TracksWorkshop < ActiveRecord::Base
  belongs_to :track
  belongs_to :workshop
end
