class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :workshop_id

      t.timestamps
    end
    add_index :votes, [:user_id, :workshop_id]
  end
end
