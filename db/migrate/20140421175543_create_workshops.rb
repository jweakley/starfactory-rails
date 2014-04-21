class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :name
      t.text :description
      t.string :status
      t.string :banner
      t.string :icon
      t.integer :track_id
      t.integer :instructor_profile_id

      t.timestamps
    end
  end
end
