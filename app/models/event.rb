class Event < ActiveRecord::Base
  belongs_to :workshop
  has_many :instructor_profiles_events
  has_many :instructor_profiles, through: :instructor_profiles_events

  VALID_STATUSES = %w(Active Disabled)

  scope :active, -> { where { status.eq 'Active' } }

  delegate :name, to: :workshop, prefix: true
end
