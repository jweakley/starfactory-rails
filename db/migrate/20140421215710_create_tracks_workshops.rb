class CreateTracksWorkshops < ActiveRecord::Migration
  def change
    create_table :tracks_workshops do |t|
      t.integer :track_id
      t.integer :workshop_id

      t.timestamps
    end
    add_index :tracks_workshops, [:track_id, :workshop_id], unique: true,
        name: 'rel_tracks_workshops'
  end
end
