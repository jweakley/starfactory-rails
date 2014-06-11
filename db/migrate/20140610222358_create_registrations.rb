class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :event_id
      t.integer :student_profile_id
      t.string :status, default: 'Pending'

      t.timestamps
    end
    add_index :registrations, [:event_id, :student_profile_id], :unique => true
  end
end
