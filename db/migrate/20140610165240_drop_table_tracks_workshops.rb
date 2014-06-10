class DropTableTracksWorkshops < ActiveRecord::Migration
  def up
    drop_table :tracks_workshops
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
