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

class Workshop < ActiveRecord::Base
  include Votable

  has_many :tracks_workshops
  has_many :tracks, through: :tracks_workshops
  has_many :events

  VALID_STATUSES = %w(Active Disabled)

  scope :active, -> { where { status.eq 'Active' } }
  scope :voted, -> { order(votes_count: :desc) }
end
