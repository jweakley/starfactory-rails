# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  status      :string(255)      default("Active")
#  starts_at   :datetime
#  ends_at     :datetime
#  workshop_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Event < ActiveRecord::Base
  belongs_to :workshop
  has_many :instructor_profiles_events
  has_many :instructor_profiles, through: :instructor_profiles_events

  VALID_STATUSES = %w(Active Disabled)
  DEFAULT_SORT_COLUMN = 'events.starts_at'

  scope :active, -> { where { status.eq 'Active' } }
  scope :upcoming, -> { where { starts_at.gteq Time.now } }
  scope :current, -> { where { ends_at.gt Time.now } }
  scope :ongoing, -> { where { (starts_at.lteq Time.now) & (ends_at.gteq Time.now) } }
  scope :by_soonest, -> { order('starts_at asc') }

  delegate :name, to: :workshop, prefix: true
  delegate :description, to: :workshop, prefix: true
  delegate :track_name, to: :workshop, prefix: true
end
