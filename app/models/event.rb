# == Schema Information
#
# Table name: events
#
#  id                  :integer          not null, primary key
#  status              :string(255)      default("Active")
#  starts_at           :datetime
#  ends_at             :datetime
#  workshop_id         :integer
#  created_at          :datetime
#  updated_at          :datetime
#  cost_in_cents       :integer          default(0)
#  registrations_count :integer          default(0)
#  registrations_max   :integer          default(0)
#

class Event < ActiveRecord::Base
  belongs_to :workshop
  has_many :instructor_profiles_events
  has_many :instructor_profiles, through: :instructor_profiles_events
  has_many :registrations
  has_many :student_profiles, through: :registrations

  VALID_STATUSES = %w(Active Disabled)
  DEFAULT_SORT_COLUMN = 'events.starts_at'

  scope :active, -> { where { status.eq 'Active' } }
  scope :upcoming, -> { where { starts_at.gteq Time.now } }
  scope :current, -> { where { ends_at.gt Time.now } }
  scope :ongoing, -> { where { (starts_at.lteq Time.now) & (ends_at.gteq Time.now) } }
  scope :by_soonest, -> { order('starts_at asc') }
  scope :registered, -> {
    includes(:registrations)
    .where( registrations: { id: nil })
    .order('registrations_count desc')
  }

  delegate :name, to: :workshop, prefix: true
  delegate :description, to: :workshop, prefix: true
  delegate :track_name, to: :workshop, prefix: true

  def cost_in_dollars
    cost_in_cents.to_d / 100.0
  end

  def cost_in_dollars=(val)
    self.cost_in_cents = (val.to_d * 100).to_i
  end

  def formatted_cost
    if cost_in_dollars <= 0
      'Free'
    elsif cost_in_dollars.to_i < cost_in_dollars
      ActionController::Base.helpers.number_to_currency(
        cost_in_dollars, precision: 2, locale: :en)
    else
      "$#{cost_in_dollars.to_i}"
    end
  end

  def smart_length
    hours = (ends_at - starts_at) / 3600
    if hours < 24
      ActionController::Base.helpers.pluralize(
        ("%g" % ("%.2f" % hours)), 'hour', 'hours')
    else
      days = (hours / 24).ceil
      ActionController::Base.helpers.pluralize(
        ("%g" % ("%.2f" % days)), 'day', 'days')
    end
  end

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
