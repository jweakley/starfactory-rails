class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.text :description
      t.string :status, default: 'Active'

      t.timestamps
    end
  end
end
