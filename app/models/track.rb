# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  status     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Track < ActiveRecord::Base
  has_many :workshops

  VALID_STATUSES = %w(Active Disabled)

  scope :active, -> { where { status.eq 'Active' } }
end
