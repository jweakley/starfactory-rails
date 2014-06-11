class AddRegistrationsMaxToEvent < ActiveRecord::Migration
  def change
    add_column :events, :registrations_max, :integer, default: 0
  end
end
