module Studentable
  extend ActiveSupport::Concern

  included do
    has_one :student_profile, inverse_of: :user
    delegate :id, to: :student_profile, prefix: true, allow_nil: true
    accepts_nested_attributes_for :student_profile
  end

  def student?
    !student_profile.nil?
  end
end
