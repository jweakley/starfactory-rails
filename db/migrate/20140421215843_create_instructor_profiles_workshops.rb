class CreateInstructorProfilesWorkshops < ActiveRecord::Migration
  def change
    create_table :instructor_profiles_workshops do |t|
      t.integer :instructor_profile_id
      t.integer :workshop_id

      t.timestamps
    end
    add_index :instructor_profiles_workshops, [:instructor_profile_id, :workshop_id],
        unique: true, name: 'rel_instructor_profiles_workshops'
  end
end
