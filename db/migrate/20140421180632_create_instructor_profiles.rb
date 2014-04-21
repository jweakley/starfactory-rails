class CreateInstructorProfiles < ActiveRecord::Migration
  def change
    create_table :instructor_profiles do |t|
      t.string :name
      t.text :bio
      t.string :avatar
      t.references :user, index: true

      t.timestamps
    end
  end
end
