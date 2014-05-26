class CreateInstructorProfilesEvents < ActiveRecord::Migration
  def change
    create_table :instructor_profiles_events do |t|
      t.integer :instructor_profile_id
      t.integer :event_id

      t.timestamps
    end
    add_index :instructor_profiles_events, [:instructor_profile_id, :event_id],
        unique: true, name: 'rel_instructor_profiles_events'
  end
end
