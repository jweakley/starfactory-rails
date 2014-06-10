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
  has_many :workshops

  VALID_STATUSES = %w(Active Disabled)
  DEFAULT_SORT_COLUMN = 'name'

  scope :active, -> { where { status.eq 'Active' } }
  scope :by_name, -> { order('name asc') }
end
