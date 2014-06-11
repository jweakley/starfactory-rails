class AddRegistrationsCountToEvent < ActiveRecord::Migration
  def change
    add_column :events, :registrations_count, :integer, default: 0
  end
end
