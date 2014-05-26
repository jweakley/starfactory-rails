class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :status, default: 'Active'
      t.datetime :starts_at
      t.datetime :ends_at
      t.integer :workshop_id

      t.timestamps
    end
    add_index :events, :workshop_id
  end
end
