module Instructorable
  extend ActiveSupport::Concern

  included do
    has_one :instructor_profile, inverse_of: :user
    delegate :id, to: :instructor_profile, prefix: true, allow_nil: true
    accepts_nested_attributes_for :instructor_profile
  end

  def instructor?
    !instructor_profile.nil?
  end
end
