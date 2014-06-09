# == Schema Information
#
# Table name: tracks
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  status      :string(255)      default("Active")
#  created_at  :datetime
#  updated_at  :datetime
#

class Track < ActiveRecord::Base
  has_many :tracks_workshops
  has_many :workshops, through: :tracks_workshops

  VALID_STATUSES = %w(Active Disabled)

  scope :active, -> { where { status.eq 'Active' } }
  scope :by_name, order(name: :asc)
end
