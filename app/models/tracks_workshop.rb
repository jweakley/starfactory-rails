class TracksWorkshop < ActiveRecord::Base
  belongs_to :track
  belongs_to :workshop
end
