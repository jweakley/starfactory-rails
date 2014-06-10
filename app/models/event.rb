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

  def starts_at_day
    starts_at.present? ? starts_at.strftime('%Y-%m-%d') : ''
  end

  def starts_at_day=(val)
    self.starts_at = DateTime.parse "#{val} #{starts_at_time}"
  end

  def starts_at_time
    starts_at.present? ? starts_at.strftime('%H:%M') : ''
  end

  def starts_at_time=(val)
    self.starts_at = DateTime.parse "#{starts_at_day} #{val}"
  end

  def ends_at_day
    ends_at.present? ? ends_at.strftime('%Y-%m-%d') : ''
  end

  def ends_at_day=(val)
    self.ends_at = DateTime.parse "#{val} #{ends_at_time}"
  end

  def ends_at_time
    ends_at.present? ? ends_at.strftime('%H:%M') : ''
  end

  def ends_at_time=(val)
    self.ends_at = DateTime.parse "#{ends_at_day} #{val}"
  end
end
