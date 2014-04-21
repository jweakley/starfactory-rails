class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :name
      t.text :description
      t.string :status
      t.string :banner
      t.string :icon

      t.timestamps
    end
  end
end
