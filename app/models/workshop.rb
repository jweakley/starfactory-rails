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
  has_many :tracks_workshops
  has_many :tracks, through: :tracks_workshops
  has_many :instructor_profiles_workshops
  has_many :instructor_profiles, through: :instructor_profiles_workshops

  VALID_STATUSES = %w(Active Disabled)

  scope :active, -> { where { status.eq 'Active' } }
end
