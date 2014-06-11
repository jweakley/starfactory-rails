# == Schema Information
#
# Table name: registrations
#
#  id                   :integer          not null, primary key
#  event_id             :integer
#  student_profile_id   :integer
#  status               :string(255)      default("Pending")
#  created_at           :datetime
#  updated_at           :datetime
#  amount_paid_in_cents :integer          default(0)
#

require 'spec_helper'

describe Registration do
  pending "add some examples to (or delete) #{__FILE__}"
end
