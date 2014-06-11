class AddAmountPaidInCentsToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :amount_paid_in_cents, :integer, default: 0
  end
end
